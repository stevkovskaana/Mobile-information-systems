import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  Future<bool> handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }

  Future<LatLng?> getCurrentLocation() async {
    bool hasUserPermission = await handleLocationPermission();
    if (!hasUserPermission) {
      return null;
    }
    try {
      Position currentPosition = await Geolocator.getCurrentPosition();
      return LatLng(currentPosition.latitude, currentPosition.longitude);
    } catch (e) {
      print('Failed to retrieve location: $e');
      return null;
    }
  }

  Future<double> calculateRouteDistance(LatLng start, LatLng end) async {
    return Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
  }
}
