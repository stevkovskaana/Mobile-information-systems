import 'package:flutter/material.dart';
import 'package:lab1/models/product_model.dart';
import 'package:lab1/widgets/product_card.dart';

class ProductGrid extends StatefulWidget {
  final List<Product> products;

  const ProductGrid({super.key, required this.products});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(6),
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      semanticChildCount: 250,
      childAspectRatio: 200 / 244,
      physics: const BouncingScrollPhysics(),
      children: widget.products
          .map(
            (product) => ProductCard(
                name: product.name,
                img: product.img,
                description: product.description,
                price: product.price),
          )
          .toList(),
    );
  }
}
