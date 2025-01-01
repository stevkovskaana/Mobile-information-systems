import 'package:flutter/material.dart';
import 'package:lab3/models/joke_model.dart';

class JokesProvider extends ChangeNotifier {
  List<Joke> favoriteJokes = [];

  void addFavoriteJoke(Joke joke) {
    favoriteJokes.add(joke);
    notifyListeners();
  }

  void removeFavoriteJoke(Joke joke) {
    favoriteJokes.remove(joke);
    notifyListeners();
  }
}
