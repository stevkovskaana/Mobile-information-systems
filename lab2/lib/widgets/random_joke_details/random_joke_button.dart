import 'package:flutter/material.dart';
import '../../screens/random_joke.dart';

class RandomJokeButton extends StatelessWidget {
  const RandomJokeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shuffle, color: Colors.black),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RandomJoke()),
        );
      },
    );
  }
}
