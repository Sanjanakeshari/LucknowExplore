import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/location_model.dart';

class LocationDataProvider {
  static Future<List<TouristLocation>> loadLocations() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/descriptions.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    final List<dynamic> locationList = jsonData['locations'];
    List<TouristLocation> locations = [];

    for (var location in locationList) {
      try {
        final id = location['id'] ?? ''; // Ensure `id` exists
        if (id.isNotEmpty) {
          locations.add(TouristLocation.fromJson(id, location));
        }
      } catch (e) {
        debugPrint('Error parsing location: $e');
      }
    }

    return locations;
  }
}
