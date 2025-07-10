import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  final String selectedLanguage;

  const HelpScreen({Key? key, required this.selectedLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        backgroundColor: const Color(0xFF5B1F1F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Need help? Your selected language is: $selectedLanguage\n\nFeel free to reach out through the form below.',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}