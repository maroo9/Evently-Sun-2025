import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class GoogleMapsservicess extends StatelessWidget {
  const GoogleMapsservicess({super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(initialCameraPosition: CameraPosition(target:LatLng(31.267734621169314, 32.29855903790257, )));
  }
}
