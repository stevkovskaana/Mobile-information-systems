import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../models/exam_model.dart';
import '../providers/exams_provider.dart';
import '../services/location_service.dart';
import '../services/route_service.dart';
import '../services/notification_service.dart';
import '../widgets/map_screen_widgets/clear_route_button.dart';

class MapScreen extends StatefulWidget {
  final DateTime selectedDate;

  const MapScreen({super.key, required this.selectedDate});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController _mapController;
  final double _mapZoomLevel = 13.0;
  List<LatLng> _routePoints = [];
  LatLng? _currentUserLocation;
  LatLng? _selectedExamLocation;
  late LocationService _locationService;
  late RouteService _routeService;
  late NotificationService _notificationService;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _locationService = LocationService();
    _routeService = RouteService(
        "5b3ce3597851110001cf62485cc413a881564e3ba4f79f2f61537da9");
    _notificationService =
        NotificationService(FlutterLocalNotificationsPlugin());

    _notificationService.initialize();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool hasUserPermission = await _locationService.handleLocationPermission();
    if (!hasUserPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission denied.')),
      );
      return;
    }
    try {
      LatLng? currentLocation = await _locationService.getCurrentLocation();
      if (currentLocation != null) {
        setState(() {
          _currentUserLocation = currentLocation;
        });
        _mapController.move(_currentUserLocation!, _mapZoomLevel);
        await _showNearbyExamNotifications();
      }
    } catch (e) {
      print('Cannot get location: $e');
    }
  }

  Future<void> _getRoute(LatLng start, LatLng end) async {
    try {
      List<LatLng> decodedCoordinates =
          await _routeService.getRoute(start, end);
      setState(() {
        _routePoints = decodedCoordinates;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to load the route. Please try again.')),
      );
    }
  }

  Future<void> _showNearbyExamNotifications() async {
    List<Exam> selectedDateExams =
        Provider.of<ExamsProvider>(context, listen: false)
            .getExamsForDate(widget.selectedDate);

    if (_currentUserLocation == null) return;

    for (var exam in selectedDateExams) {
      double distance = await _locationService.calculateRouteDistance(
        _currentUserLocation!,
        exam.location,
      );
      if (distance <= 500) {
        _notificationService.showNotification();
      }
    }
  }

  void _clearRoute() {
    setState(() {
      _routePoints.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Exam> selectedDateExams = Provider.of<ExamsProvider>(context)
        .getExamsForDate(widget.selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Locations Map'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _currentUserLocation ?? const LatLng(41.9981, 21.4254),
              zoom: _mapZoomLevel,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  if (_currentUserLocation != null)
                    Marker(
                      point: _currentUserLocation!,
                      builder: (ctx) => const Icon(
                        Icons.my_location,
                        size: 35,
                        color: Colors.blue,
                      ),
                    ),
                  ...selectedDateExams.map((exam) {
                    return Marker(
                      point: exam.location,
                      builder: (ctx) => IconButton(
                        icon: const Icon(
                          Icons.location_on,
                          size: 35,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          setState(() {
                            _selectedExamLocation = exam.location;
                          });
                          if (_currentUserLocation != null &&
                              _selectedExamLocation != null) {
                            await _getRoute(
                                _currentUserLocation!, _selectedExamLocation!);
                          }
                        },
                      ),
                    );
                  }),
                ],
              ),
              if (_routePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePoints,
                      strokeWidth: 3.0,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
            ],
          ),
          if (_routePoints.isNotEmpty)
            Positioned(
              bottom: 20,
              right: 20,
              child: Column(
                children: [
                  ClearRouteButton(onPressed: _clearRoute),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
