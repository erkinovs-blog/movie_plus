part of 'lang_bloc.dart';

@immutable
abstract class LangEvent {
  abstract final String locale;
}

class LangNewEvent extends LangEvent {
  @override
  final String locale;

  LangNewEvent({required this.locale});
}
