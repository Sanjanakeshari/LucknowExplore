import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/language_selection_screen.dart';
import 'screens/home_screen.dart';
import 'screens/location_detail_screen.dart';
import 'screens/audio_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/help_screen.dart';
import 'screens/about_us_screen.dart';

import 'services/translation_service.dart';
import 'services/tts_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TranslationService.init();
  await TTSService.init();

  runApp(const LucknowExploreApp());
}

class LucknowExploreApp extends StatelessWidget {
  const LucknowExploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lucknow Explore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final args = settings.arguments as Map<String, dynamic>? ?? {};

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case '/welcome':
            return MaterialPageRoute(builder: (_) => const WelcomeScreen());
          case '/language':
            return MaterialPageRoute(builder: (_) => const LanguageSelectionScreen());
          case '/home':
            return MaterialPageRoute(
              builder: (_) => HomeScreen(selectedLanguage: args['selectedLanguage'] ?? 'en'),
            );
          case '/details':
            return MaterialPageRoute(
              builder: (_) => LocationDetailScreen(
                location: args['location'],
                selectedLanguage: args['selectedLanguage'] ?? 'en', sitekey: '', siteKey: '',
              ),
            );
          case '/audio':
            return MaterialPageRoute(
              builder: (_) => AudioScreen(siteKey: args['siteKey'] ?? 'unknown'),
            );
          case '/gallery':
            return MaterialPageRoute(
              builder: (_) => GalleryScreen(
                locationId: args['locationId'] ?? 'unknown',
                title: args['title'] ?? 'Gallery',
              ),
            );
          case '/help':
            return MaterialPageRoute(
              builder: (_) => HelpScreen(selectedLanguage: args['selectedLanguage'] ?? 'en'),
            );
          case '/about':
            return MaterialPageRoute(builder: (_) => const AboutUsScreen(selectedLanguage: 'en'));
          default:
            return null;
        }
      },
      supportedLocales: const [
        Locale('en'), Locale('hi'), Locale('bn'), Locale('ta'), Locale('te'),
        Locale('mr'), Locale('gu'), Locale('kn'), Locale('ml'), Locale('pa'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}