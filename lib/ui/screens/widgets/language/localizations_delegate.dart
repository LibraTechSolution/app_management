import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'languages.dart';
import 'languages_en.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi', 'ja'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    Logger().i('hjhj $locale');
    switch (locale.languageCode) {
      // case 'vi':
      //   return LanguageVn();
      // case 'en':
      //   return LanguageEn();
      // case 'ja':
      //   return LanguageJp();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
