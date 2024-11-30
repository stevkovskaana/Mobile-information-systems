import 'package:flutter/material.dart';

class DetailData extends StatelessWidget {
  final String description;
  final double price;

  const DetailData({super.key, required this.description, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: 250,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 2, color: Colors.deepPurpleAccent),
          left: BorderSide(width: 2, color: Colors.deepPurpleAccent),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(71),
          topRight: Radius.circular(71),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Text(
              '$description',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$$price',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
