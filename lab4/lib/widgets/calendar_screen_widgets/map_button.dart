import 'package:flutter/material.dart';
import '../../screens/map_screen.dart';

class MapButton extends StatelessWidget {
  final DateTime? selectedDate;

  const MapButton({super.key, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (selectedDate != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => MapScreen(selectedDate: selectedDate!),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Select date!'),
            ),
          );
        }
      },
      child: const Icon(Icons.map),
    );
  }
}
