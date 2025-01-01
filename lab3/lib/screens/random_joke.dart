import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/joke_model.dart';
import '../widgets/random_joke_details/random_joke_data.dart';

class RandomJoke extends StatefulWidget {
  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  Joke? randomJoke;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRandomJoke();
  }

  void getRandomJoke() async {
    ApiService.getRandomJokeFromAPI().then((response) {
      setState(() {
        randomJoke = Joke.fromJson(jsonDecode(response.body));
        isLoading = false;
      });
    }).catchError((error) {
      print("Error fetching joke: $error");
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Joke Of The Day'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : randomJoke != null
          ? RandomJokeData(joke: randomJoke!)
          : const Center(
        child: Text(
          "No joke available.",
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
