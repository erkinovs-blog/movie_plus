import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_plus_app/src/common/data/storage/storage.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial()) {
    print("initState");
    on<LangEvent>((event, emit) {
      $storage.setString(StorageKeys.locale.key, event.locale);
      emit(LangInitial(locale: event.locale));
    });
  }

  @override
  Future<void> close() {
    print("dispose");
    return super.close();
  }


  String get currentLocale => state.locale;
}
