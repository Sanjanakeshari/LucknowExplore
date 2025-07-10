import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslationService {
  static late OnDeviceTranslator _translator;
  static String _selectedLanguage = 'en';

  static Future<void> init() async {
    _translator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: TranslateLanguage.hindi, // default fallback
    );
  }

  static Future<void> setLanguage(String langCode) async {
    _selectedLanguage = langCode;

    final targetLang = _getTranslateLanguage(langCode);
    _translator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: targetLang,
    );
  }

  static String get currentLanguage => _selectedLanguage;

  static Future<String> translate(String inputText) async {
    if (_selectedLanguage == 'en') return inputText;
    try {
      final translated = await _translator.translateText(inputText);
      return translated;
    } catch (_) {
      return inputText;
    }
  }

  static TranslateLanguage _getTranslateLanguage(String code) {
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
      //  return TranslateLanguage.malayalam;
      //case 'pa':
      //  return TranslateLanguage.punjabi;
      default:
        return TranslateLanguage.english;
    }
  }
}
