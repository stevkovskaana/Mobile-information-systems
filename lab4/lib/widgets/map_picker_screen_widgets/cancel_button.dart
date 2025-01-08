import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final BuildContext context;

  const CancelButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        'Cancel',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
