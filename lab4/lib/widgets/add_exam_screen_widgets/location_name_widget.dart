import 'package:flutter/material.dart';

class LocationNameField extends StatelessWidget {
  final String locationName;
  final ValueChanged<String> onLocationNameUpdated;

  const LocationNameField({
    super.key,
    required this.locationName,
    required this.onLocationNameUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: locationName,
      decoration: const InputDecoration(labelText: 'Location Name'),
      onChanged: onLocationNameUpdated,
    );
  }
}
