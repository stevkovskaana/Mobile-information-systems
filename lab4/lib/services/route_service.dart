import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class RouteService {
  final String apiKey;

  RouteService(this.apiKey);

  Future<List<LatLng>> getRoute(LatLng start, LatLng end) async {
    const url = 'https://api.openrouteservice.org/v2/directions/foot-walking';
    final body = json.encode({
      "coordinates": [
        [start.longitude, start.latitude],
        [end.longitude, end.latitude],
      ],
      "preference": "shortest",
    });

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': apiKey,
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['routes'].isNotEmpty) {
        return _decodePolyline(data['routes'][0]['geometry']);
      }
    }

    throw Exception('Failed to load the route');
  }

  List<LatLng> _decodePolyline(String encoded) {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = polylinePoints.decodePolyline(encoded);
    return result
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();
  }
}
