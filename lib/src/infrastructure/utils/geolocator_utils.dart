import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorUtils {
  Future<bool> checkGPSEnabled() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();
    return isEnabled;
  }

  Future<void> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        debugPrint("'Location permissions are permanently denied");
      } else {
        debugPrint("GPS Location service is granted");
      }
    } else {
      debugPrint("GPS Location permission granted.");
    }
  }

  Future<Position> getLatLongCurrentLocation() async {
    final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return currentPosition;
  }
}
