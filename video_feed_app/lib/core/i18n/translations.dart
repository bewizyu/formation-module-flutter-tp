import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

/// [Translations]
///
/// - Wrapper for locale
/// - Initialize [_localizedValues] with load method and [Locale]
///
/// This sample code is comming from this blog post
/// https://www.didierboelens.com/fr/2018/04/internationalisation---r%C3%A9alisez-une-application-flutter-multilingue/
class Translations {
  static Map<dynamic, dynamic> _localizedValues;

  Locale locale;

  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  get currentLanguage => locale.languageCode;

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  /// Load the locale Json file with [locale]
  /// and return a [Transactions] with
  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    String jsonContent =
        await rootBundle.loadString("locales/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);

    return translations;
  }

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }
}
