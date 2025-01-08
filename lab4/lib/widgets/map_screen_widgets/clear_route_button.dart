import 'package:flutter/material.dart';

class ClearRouteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ClearRouteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: onPressed,
      child: const Icon(Icons.clear),
    );
  }
}
