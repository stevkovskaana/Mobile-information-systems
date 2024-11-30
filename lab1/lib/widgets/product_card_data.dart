import 'package:flutter/material.dart';

class ProductCardData extends StatelessWidget {
  final String name;
  final String img;

  const ProductCardData({super.key, required this.name, required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Image.network(img,
                fit: BoxFit.contain, alignment: Alignment.bottomRight)),
        const Divider(),
        Text(
          "${name[0].toUpperCase()}${name.substring(1)}",
          style: const TextStyle(
              fontSize: 21, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
