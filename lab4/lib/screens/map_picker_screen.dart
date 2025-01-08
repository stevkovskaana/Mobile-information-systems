import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/map_picker_screen_widgets/cancel_button.dart';
import '../widgets/map_picker_screen_widgets/done_button.dart';

class MapPickerScreen extends StatefulWidget {
  final LatLng initialPickedLocation;

  const MapPickerScreen({super.key, required this.initialPickedLocation});

  @override
  _MapPickerScreenState createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  late MapController _mapController;
  late LatLng _pickedLocation;
  final double _mapZoomLevel = 13.0;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _pickedLocation = widget.initialPickedLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _pickedLocation,
              zoom: _mapZoomLevel,
              onTap: (tapPosition, pickedPoint) {
                setState(() {
                  _pickedLocation = pickedPoint;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _pickedLocation,
                    builder: (ctx) => const Icon(
                      Icons.location_on,
                      size: 35,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CancelButton(context: context),
                    const SizedBox(width: 30),
                    DoneButton(
                        context: context, pickedLocation: _pickedLocation),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
