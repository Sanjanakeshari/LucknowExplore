import 'package:flutter/material.dart';

class AudioScreen extends StatelessWidget {
  final String siteKey;

  const AudioScreen({Key? key, required this.siteKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Guide'),
        backgroundColor: const Color(0xFF5B1F1F),
      ),
      body: Center(
        child: Text('Playing audio for: $siteKey', style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
