import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/locale_provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);

    return DropdownButton<Locale>(
      underline: const SizedBox(),
      icon: const Icon(Icons.language),
      onChanged: (Locale? locale) {
        if (locale != null) {
          provider.setLocale(locale);
        }
      },
      items: const [
        DropdownMenuItem(value: Locale('en'), child: Text("English")),
        DropdownMenuItem(value: Locale('hi'), child: Text("हिंदी")),
      ],
    );
  }
}
