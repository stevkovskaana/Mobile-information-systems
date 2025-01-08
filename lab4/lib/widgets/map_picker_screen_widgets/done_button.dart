import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class DoneButton extends StatelessWidget {
  final BuildContext context;
  final LatLng pickedLocation;

  const DoneButton(
      {super.key, required this.context, required this.pickedLocation});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(pickedLocation);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        'Done',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
