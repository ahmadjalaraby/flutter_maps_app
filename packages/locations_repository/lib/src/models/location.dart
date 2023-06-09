import 'package:location_api_client/location_api_client.dart';

/// Location model which include location: name, lable, latitued, longitude
class Location {
  /// const constructor of the Location model
  const Location({
    required this.name,
    required this.label,
    required this.latitude,
    required this.longitude,
  });

  /// returns the instance of the Location based on LocationData
  factory Location.fromLocationData(LocationData data) {
    return Location(
      name: data.name,
      label: data.label,
      latitude: data.latitude,
      longitude: data.longitude,
    );
  }

  /// location name [String]
  final String name;

  /// location label [String]
  final String label;

  /// location longitude [double]
  final double latitude;

  /// location latitued [double]
  final double longitude;
}
