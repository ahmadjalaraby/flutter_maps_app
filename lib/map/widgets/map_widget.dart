import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_maps/theme/theme.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    final searchingPoint = LatLng(latitude, longitude);
    return FlutterMap(
      options: MapOptions(
        center: searchingPoint,
        zoom: 11,
        keepAlive: true,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            _searchingPointMarker(latLng: searchingPoint),
          ],
        ),
      ],
    );
  }

  Marker _searchingPointMarker({required LatLng latLng}) {
    return Marker(point: latLng, builder: _searchingPointMarkerBuilder);
  }

  Widget _searchingPointMarkerBuilder(BuildContext context) {
    return const Icon(
      Icons.place,
      size: 30,
      color: AppColors.red,
    );
  }
}
