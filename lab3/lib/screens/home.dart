import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lab3/services/api_service.dart';
import 'package:lab3/widgets/joke_types/joke_types_list.dart';
import 'package:lab3/widgets/random_joke_details/random_joke_button.dart';
import 'package:provider/provider.dart';

import '../providers/jokes_provider.dart';
import '../widgets/favorite_jokes_details/favorites_icon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    getJokeTypesFromAPI();
  }

  void getJokeTypesFromAPI() async {
    ApiService.getJokeTypesFromAPI().then((response) {
      var data = List<String>.from(json.decode(response.body));
      setState(() {
        jokeTypes = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final jokesProvider = Provider.of<JokesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        leading: const RandomJokeButton(),
        title: const Text("Joke Types",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          FavoritesIcon(
            favoritesCounter: jokesProvider.favoriteJokes.length,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: JokeTypesList(jokeTypes: jokeTypes),
    );
  }
}
