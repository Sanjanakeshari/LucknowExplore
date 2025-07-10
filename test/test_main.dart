// test_main.dart
import 'package:flutter/material.dart';
import 'package:lucknow_explore/screens/home_screen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(selectedLanguage: 'en',),
  ));
}
