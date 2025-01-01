import 'package:flutter/material.dart';
import 'package:lab3/models/joke_model.dart';
import 'package:provider/provider.dart';
import '../../providers/jokes_provider.dart';

class FavoritesButton extends StatelessWidget {
  final Joke joke;

  const FavoritesButton({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    final jokesProvider = Provider.of<JokesProvider>(context);

    final isFavorite = jokesProvider.favoriteJokes.any((j) => j.id == joke.id);

    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onPressed: () {
        if (isFavorite) {
          jokesProvider.removeFavoriteJoke(joke);
        } else {
          jokesProvider.addFavoriteJoke(joke);
        }
      },
    );
  }
}