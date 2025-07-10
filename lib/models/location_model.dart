class TouristLocation {
  final String id;
  final String title;
  final String description;
  final double latitude;
  final double longitude;
  final String imageFolder;

  TouristLocation({
    required this.id,
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.imageFolder,
  });

  // Updated factory that safely parses lat/lng from any type (int, string, double)
  factory TouristLocation.fromJson(String id, Map<String, dynamic> json) {
    double parseDouble(dynamic val) {
      if (val is double) return val;
      if (val is int) return val.toDouble();
      if (val is String) return double.tryParse(val) ?? 0.0;
      return 0.0;
    }

    return TouristLocation(
      id: id,
    title: json['title'],
    description: json['description'],
    latitude: (json['lat'] as num).toDouble(),
    longitude: (json['lng'] as num).toDouble(),
    imageFolder: 'assets/images/$id/gallery/',
    );
  }
}
