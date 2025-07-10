import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslatorHelper {
  static final _baseLang = 'en';

  static Future<Map<String, String>> loadAndTranslate(String targetLangCode) async {
    final String jsonString = await rootBundle.loadString('assets/lang/en_description.json');
    final Map<String, dynamic> baseContent = json.decode(jsonString);
    final Map<String, String> translatedContent = {};

    if (targetLangCode == _baseLang) {
      return baseContent.map((key, value) => MapEntry(key, value.toString()));
    }

    final onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: _getTranslateLang(targetLangCode),
    );

    for (final key in baseContent.keys) {
      final translation = await onDeviceTranslator.translateText(baseContent[key]);
      translatedContent[key] = translation;
    }

    await onDeviceTranslator.close();
    return translatedContent;
  }

  static TranslateLanguage _getTranslateLang(String code) {
    switch (code) {
      case 'hi':
        return TranslateLanguage.hindi;
      case 'bn':
        return TranslateLanguage.bengali;
      case 'ta':
        return TranslateLanguage.tamil;
      case 'te':
        return TranslateLanguage.telugu;
      case 'mr':
        return TranslateLanguage.marathi;
      case 'gu':
        return TranslateLanguage.gujarati;
      case 'kn':
        return TranslateLanguage.kannada;
      //case 'ml':
        //return TranslateLanguage.malayalam;
      //case 'pa':
        //return TranslateLanguage.punjabi;
      default:
        return TranslateLanguage.english;
    }
  }
}
