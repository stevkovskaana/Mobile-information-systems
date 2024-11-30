import 'package:flutter/material.dart';
import 'package:lab1/models/product_model.dart';
import 'package:lab1/widgets/product_card_data.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String img;
  final String description;
  final double price;

  const ProductCard(
      {super.key,
      required this.name,
      required this.img,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(7),
        enableFeedback: true,
        splashColor: Colors.deepPurple[50],
        onTap: () => {
          Navigator.pushNamed(context, "/details",
              arguments: Product(
                  name: name, img: img, description: description, price: price))
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.deepPurple.withOpacity(0.8), width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: ProductCardData(name: name, img: img),
        ),
      ),
    );
  }
}
