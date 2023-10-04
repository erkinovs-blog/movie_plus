part of 'lang_bloc.dart';

@immutable
abstract class LangState {
  abstract final String locale;

  static final locales = [
    ("O'zbekcha", LangNewEvent(locale: "uz")),
    ("English", LangNewEvent(locale: "en")),
    ("Русский", LangNewEvent(locale: "ru")),
  ];
}

class LangInitial extends LangState {
  @override
  final String locale;

  LangInitial({String? locale})
      : locale = locale ?? $storage.getString(StorageKeys.locale.key) ?? "en";
}
