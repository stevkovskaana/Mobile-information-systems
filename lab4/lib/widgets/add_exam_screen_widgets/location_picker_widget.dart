import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../../screens/map_picker_screen.dart';

class LocationPicker extends StatelessWidget {
  final LatLng? location;
  final ValueChanged<LatLng?> onLocationPicked;

  const LocationPicker({
    super.key,
    required this.location,
    required this.onLocationPicked,
  });

  void _pickedLocation(BuildContext context) async {
    LatLng? pickedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        builder: (ctx) => MapPickerScreen(
          initialPickedLocation: location ?? const LatLng(41.9981, 21.4254),
        ),
      ),
    );

    if (pickedLocation != null) {
      onLocationPicked(pickedLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            location == null ? 'No location selected' : 'Location selected',
          ),
        ),
        TextButton(
          onPressed: () => _pickedLocation(context),
          child: const Text('Select Location'),
        ),
      ],
    );
  }
}
