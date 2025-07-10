import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  final String selectedLanguage;

  const AboutUsScreen({Key? key, required this.selectedLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF5B1F1F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Welcome to the Lucknow Explore app.\n\n'
          'Your selected language is: $selectedLanguage\n\n'
          'This app guides you through the cultural heritage of Lucknow, even offline!',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
