import 'package:flutter/material.dart';
import '../models/location_model.dart';
import '../utils/translation_util.dart'; // We'll write this to handle translations
import 'gallery_screen.dart';
import 'map_screen.dart';
import 'audio_screen.dart';
import 'home_screen.dart';

class LocationDetailScreen extends StatelessWidget {
  final TouristLocation location;
  final String selectedLanguage;
  final String sitekey;

  const LocationDetailScreen({
    Key? key,
    required this.location,
    required this.selectedLanguage,
    required this.sitekey, required String siteKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translatedDescription = TranslationUtil.translate(
      location.id,
      location.description,
      selectedLanguage,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        backgroundColor: const Color(0xFF5B1F1F),
      ),
      backgroundColor: const Color(0xFFFBEFEF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              '${location.imageFolder}cover.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image, size: 80),
            ),
            const SizedBox(height: 16),
            Text(
              translatedDescription,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(selectedLanguage: selectedLanguage),
                    ),
                  ),
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                  style: _buttonStyle(),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GalleryScreen(
                        locationId: location.id,
                        title: location.title,
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Gallery'),
                  style: _buttonStyle(),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AudioScreen(
                          siteKey: location.id, // Use the id from TouristLocation model
                         ),
                       ),
                    ),
                    icon: const Icon(Icons.volume_up),
                    label: const Text('Audio'),
                    style: _buttonStyle(),
                   ),

                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MapScreen(
                        locationId: location.id,
                        title: location.title,
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.location_on),
                  label: const Text('Location'),
                  style: _buttonStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF5B1F1F),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    );
  }
}
