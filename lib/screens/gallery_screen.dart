import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final String locationId;
  final String title;

  const GalleryScreen({Key? key, required this.locationId, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/$locationId/rumi1.png',
      'assets/images/$locationId/rumi2.png',
      'assets/images/$locationId/rumi3.png',
      'assets/images/$locationId/rumi4.png',
      'assets/images/$locationId/rumi5.png',
      'assets/images/$locationId/rumi6.png',
      'assets/images/$locationId/rumi7.png',
      'assets/images/$locationId/rumi8.png',
      'assets/images/$locationId/resi1.png',
      'assets/images/$locationId/resi2.png',
      'assets/images/$locationId/resi3.png',
      'assets/images/$locationId/resi4.png',
      'assets/images/$locationId/resi5.png',
      'assets/images/$locationId/resi6.png',
      'assets/images/$locationId/resi7.png',
      'assets/images/$locationId/resi8.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$title Gallery'),
        backgroundColor: const Color(0xFF5B1F1F),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => Image.asset(images[index], fit: BoxFit.cover),
      ),
    );
  }
}