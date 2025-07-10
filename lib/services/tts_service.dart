import 'package:flutter_tts/flutter_tts.dart';
import 'translation_service.dart';

class TTSService {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> init() async {
    await _tts.setSpeechRate(0.5);
    await _tts.setPitch(1.0);
    await _tts.setVolume(1.0);
    await _setLanguage(TranslationService.currentLanguage);
  }

  static Future<void> _setLanguage(String code) async {
    final langCode = switch (code) {
      'en' => 'en-IN',
      'hi' => 'hi-IN',
      'bn' => 'bn-IN',
      'ta' => 'ta-IN',
      'te' => 'te-IN',
      'mr' => 'mr-IN',
      'gu' => 'gu-IN',
      'kn' => 'kn-IN',
      'ml' => 'ml-IN',
      'pa' => 'pa-IN',
      _ => 'en-IN',
    };
    await _tts.setLanguage(langCode);
  }

  static Future<void> speak(String text) async {
    await _setLanguage(TranslationService.currentLanguage);
    await _tts.speak(text);
  }

  static Future<void> stop() async {
    await _tts.stop();
  }
}
