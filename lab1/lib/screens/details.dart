import 'package:flutter/material.dart';
import 'package:lab1/models/product_model.dart';
import '../widgets/detail_title.dart';
import '../widgets/detail_image.dart';
import '../widgets/detail_data.dart';
import '../widgets/detail_back_button.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DetailImage(image: arguments.img),
            DetailTitle(name: arguments.name),
            const SizedBox(height: 16),
            DetailData(
                description: arguments.description, price: arguments.price),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const DetailBackButton(),
    );
  }
}
