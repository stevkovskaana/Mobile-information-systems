import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final String type;

  const DetailTitle({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      label: Text(
        type,
        style: TextStyle(fontSize: 24, color: Colors.deepPurple[900]),
      ),
    );
  }
}
