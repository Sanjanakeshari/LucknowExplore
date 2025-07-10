import 'package:flutter/material.dart';
import '../data/locations_data.dart';
import '../models/location_model.dart';
import 'location_detail_screen.dart';
import 'help_screen.dart';
import 'about_us_screen.dart';

// Ensure this exists

class HomeScreen extends StatelessWidget {
  final String selectedLanguage;

  const HomeScreen({Key? key, required this.selectedLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBEFEF),
      appBar: AppBar(
        title: const Text('Explore Lucknow'),
        backgroundColor: const Color(0xFF5B1F1F),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'language') {
                Navigator.pushNamed(context, '/language');
              } else if (value == 'help') {
                Navigator.pushNamed(context, '/help');
              } else if (value == 'about') {
                Navigator.pushNamed(context, '/about');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'language', child: Text('Change Language')),
              const PopupMenuItem(value: 'help', child: Text('Help')),
              const PopupMenuItem(value: 'about', child: Text('About Us')),
            ],
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildLocationCard(
            context,
            title: 'Rumi Darwaza',
            imagePath: 'assets/images/rumi/gallery/rumi1.png',
            description:
                'The Rumi Darwaza is one of the most iconic architectural structures in Lucknow.',
            siteKey: 'rumi_darwaza',
          ),
          const SizedBox(height: 20),
          _buildLocationCard(
            context,
            title: 'The Residency',
            imagePath: 'assets/images/the_residency/gallery/resi1.png',
            description:
                'The Residency served as a refuge for British inhabitants during the 1857 revolt.',
            siteKey: 'the_residency',
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context,
      {required String title,
      required String imagePath,
      required String description,
      required String siteKey}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox(height: 200, child: Center(child: Icon(Icons.image_not_supported))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(description,
                    style: const TextStyle(fontSize: 14, color: Colors.black87)),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B1F1F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    label: const Text('Explore'),
                    onPressed: () {
                   
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
