import 'package:latlong2/latlong.dart';

class Exam {
  final String id;
  final String title;
  final DateTime dateTime;
  final String locationName;
  final LatLng location;

  Exam({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.locationName,
    required this.location,
  });
}
