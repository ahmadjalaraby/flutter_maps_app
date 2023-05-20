import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location_api_client/src/models/location_data.dart';

/// Exception thrown when getLocations method fails
class GetLocationsRequestFailure implements Exception {}

/// Exception thrown LocationData from json fails
class GetLocationsDeserializationFailure implements Exception {}

/// {@template location_api_client}
/// Flutter package that handles location api requests
/// {@endtemplate}
class LocationApiClient {
  /// {@macro location_api_client}
  LocationApiClient(http.Client? httpCLient)
      : _httpClient = httpCLient ?? http.Client();

  final http.Client _httpClient;

  static const String _apiKey = 'f4f4ccf970737457a607072bd2030974';
  static const String _apiBaseUrl = 'api.positionstack.com';
  static const String _forwardMethod = '/v1/forward';

  final _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  /// Get locations by name
  Future<List<LocationData>> getLocations({required String location}) async {
    final queryParameters = {
      'access_key': _apiKey,
      'query': location,
    };

    final uri = Uri.http(
      _apiBaseUrl,
      _forwardMethod,
      queryParameters,
    );

    final response = await _httpClient.get(
      uri,
      headers: _headers,
    );

    if (response.statusCode != 200) {
      throw GetLocationsRequestFailure();
    }

    final locations = <LocationData>[];

    try {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      final jsonData = List<Map<String, dynamic>>.from(json['data'] as List);

      for (final jsonLocation in jsonData) {
        final location = LocationData.fromJson(jsonLocation);
        locations.add(location);
      }

      return locations;
    } catch (_) {
      throw GetLocationsDeserializationFailure();
    }
  }
}
