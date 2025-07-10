import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> languages = const [
    {'code': 'en', 'label': 'English'},
    {'code': 'hi', 'label': 'Hindi'},
    {'code': 'bn', 'label': 'Bengali'},
    {'code': 'ta', 'label': 'Tamil'},
    {'code': 'te', 'label': 'Telugu'},
    {'code': 'mr', 'label': 'Marathi'},
    {'code': 'gu', 'label': 'Gujarati'},
    {'code': 'kn', 'label': 'Kannada'},
    {'code': 'ml', 'label': 'Malayalam'},
    {'code': 'pa', 'label': 'Punjabi'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        backgroundColor: const Color(0xFF5B1F1F),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3,
        ),
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final language = languages[index];
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF5B1F1F),
              textStyle: const TextStyle(fontSize: 18,color:Colors.white),
            ),
            onPressed: () {
              // Navigate to Home screen and pass the selected language
              Navigator.pushNamed(
                context,
                '/home',
                arguments: {'selectedLanguage': language['code']},
              );
            },
            child: Text(language['label']!),
          );
        },
      ),
    );
  }
}
