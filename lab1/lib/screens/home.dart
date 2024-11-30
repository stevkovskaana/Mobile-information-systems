import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = [
    Product(
      name: 'Party Dress',
      img:
          'https://i.pinimg.com/736x/b4/c3/7d/b4c37d7489ccbeeedf7c164a30281488.jpg',
      description:
          'Party dress designed for a flawless fit and unforgettable style.',
      price: 41.0,
    ),
    Product(
      name: 'Wedding Dress',
      img:
          'https://i.pinimg.com/736x/e1/57/1e/e1571e5631d2c5e45009004a8cbd87cd.jpg',
      description:
          'Wedding dress designed to highlight your beauty with intricate details and a timeless silhouette.',
      price: 350.0,
    ),
    Product(
      name: 'Flannel Shirt',
      img:
          'https://i.pinimg.com/736x/a4/54/2d/a4542d3ffa0fe6dbcf1cb589405e5c07.jpg',
      description:
          'Classic green flannel shirt, combining comfort and timeless style.',
      price: 25.0,
    ),
    Product(
      name: 'Shirt',
      img:
          'https://thestiffcollarcoupons.wordpress.com/wp-content/uploads/2014/01/men-formal-shirt.jpg',
      description:
          'Stylish pink shirt for men, perfect for a bold and modern look.',
      price: 80.0,
    ),
    Product(
      name: 'Skater Skirt',
      img:
          'https://www.dailyhaute.com/cdn/shop/products/Women-s-Basic-Versatile-Stretchy-Flared-Casual-Mini-Skater-Skirt-Daily-Haute-8483_1154x1500.jpg?v=1695812595',
      description:
          'Chic and playful skater skirt, perfect for any casual or trendy outfit.',
      price: 25.99,
    ),
    Product(
      name: 'Pants',
      img:
          'https://i.pinimg.com/736x/e2/e0/b6/e2e0b65510f3150828d6a5b2cf007421.jpg',
      description:
          'Classic black formal pants, tailored for a sharp and sophisticated look.',
      price: 30.0,
    ),
    Product(
      name: 'Jeans',
      img:
          'https://i.pinimg.com/736x/ee/f9/7b/eef97b5bd25cef37b46befa254262c24.jpg',
      description: 'Relaxed, roomy denim with a retro-inspired cut.',
      price: 75.0,
    ),
    Product(
      name: 'Leather Jacket',
      img:
          'https://i.pinimg.com/736x/5f/84/c0/5f84c0f92f050b97e2f60e7301d07949.jpg',
      description:
          'Timeless leather jacket, offering both durability and a sleek, modern look.',
      price: 150.00,
    ),
    Product(
      name: 'Shoes',
      img:
          'https://i.pinimg.com/736x/3a/bf/2a/3abf2a791d25b6de87ed2742841c81a1.jpg',
      description: 'Stylish and functional with adjustable details.',
      price: 85.00,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 24,
            )),
        title: const Text("211076",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.white, size: 24))
        ],
      ),
      body: ProductGrid(products: products),
    );
  }
}
