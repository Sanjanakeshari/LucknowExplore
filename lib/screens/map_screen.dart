import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  final String locationId;
  final String title;

  const MapScreen({super.key, required this.locationId, required this.title});

  @override
  Widget build(BuildContext context) {
    // Define coordinates for known locations
    final coordinates = {
      'rumi_darwaza': LatLng(26.8705, 80.9111),
      'residency': LatLng(26.8572, 80.9190),
    };

    final LatLng center = coordinates[locationId] ?? LatLng(0, 0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Map - $title'),
        backgroundColor: const Color(0xFF5B1F1F),
      ),
      backgroundColor: const Color(0xFFFBEFEF),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: center,
          initialZoom: 17,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.lucknow_explore',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: center,
                width: 80,
                height: 80,
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
