import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5e5e0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Image(
                image: AssetImage('assets/images/logo.png'), // same logo as splash
                width: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'WELCOME',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff6a1b1a),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Step right into Lucknow’s Iconic Destinations',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/language');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6a1b1a),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
