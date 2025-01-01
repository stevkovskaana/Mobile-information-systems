import 'package:flutter/material.dart';

class FavoritesIcon extends StatelessWidget {
  final int favoritesCounter;

  const FavoritesIcon({
    super.key,
    required this.favoritesCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            Navigator.pushNamed(context, '/favorites');
          },
        ),
        if (favoritesCounter > 0)
          Positioned(
            right: 2,
            top: 1,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              constraints: const BoxConstraints(
                minWidth: 15,
                minHeight: 15,
              ),
              child: Center(
                child: Text(
                  favoritesCounter.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
