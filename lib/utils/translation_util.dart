import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// A utility class for handling translation of location descriptions.
class TranslationUtil {
  static Map<String, dynamic>? _translations;

  /// Loads the translation file for a given language code.
  static Future<void> loadTranslations(String languageCode) async {
    try {
      final String data =
          await rootBundle.loadString('assets/lang/$languageCode.json');
      _translations = json.decode(data);
    } catch (e) {
      _translations = null;
    }
  }

  /// Returns translated text for a location ID.
  /// If translation is not found, returns original fallbackText.
  static String translate(String locationId, String fallbackText, String languageCode) {
    if (_translations == null) {
      return fallbackText;
    }

    final translated = _translations![locationId];
    return translated != null ? translated.toString() : fallbackText;
  }
}
