import 'package:flutter/material.dart';
import '../widgets/favorite_jokes_details/favorites_data.dart';

class FavoriteJokes extends StatefulWidget{
  const FavoriteJokes({super.key});

  @override
  State<FavoriteJokes> createState() => _FavoriteJokesState();
}

class _FavoriteJokesState extends State<FavoriteJokes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Jokes"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[200],
      ),
      body: const Column(
        children: [
          FavoritesData(),
        ],
      ),
    );
  }
}