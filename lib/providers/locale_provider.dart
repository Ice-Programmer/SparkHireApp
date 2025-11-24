import 'package:flutter/material.dart';

class LanguageItem {
  final Locale locale;
  final String text;
  final String flag;

  LanguageItem({required this.locale, required this.text, required this.flag});
}

final List<Locale> supportedLocales =
    languageItems.map((e) => e.locale).toList();

final List<LanguageItem> languageItems = [
  LanguageItem(
    locale: const Locale('en'),
    text: "English",
    flag: "icons/flags/svg/gb.svg",
  ),
  LanguageItem(
    locale: const Locale('zh'),
    text: "简体中文",
    flag: "icons/flags/svg/cn.svg",
  ),
  LanguageItem(
    locale: const Locale('ja'),
    text: "日本語",
    flag: "icons/flags/svg/jp.svg",
  ),
];

class LocaleProvider with ChangeNotifier {
  late Locale _locale;

  LocaleProvider() {
    _locale = _getInitialLocale();
  }

  Locale get locale => _locale;

  Locale _getInitialLocale() {
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

    for (final supported in supportedLocales) {
      if (supported.languageCode == deviceLocale.languageCode) {
        return supported;
      }
    }

    return supportedLocales.first;
  }

  void toggleLocale() {
    final currentIndex = supportedLocales.indexOf(_locale);
    final nextIndex = (currentIndex + 1) % supportedLocales.length;
    _locale = supportedLocales[nextIndex];
    notifyListeners();
  }

  void setLocale(Locale newLocale) {
    if (!supportedLocales.contains(newLocale)) return;
    _locale = newLocale;
    notifyListeners();
  }
}
