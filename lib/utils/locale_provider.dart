import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('hi'),
    const Locale('bn'),
    const Locale('ta'),
    const Locale('te'),
    const Locale('mr'),
    const Locale('gu'),
    const Locale('kn'),
    const Locale('ur'),
    const Locale('pa'),  // add more as needed
  ];
}
