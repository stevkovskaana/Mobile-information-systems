import 'package:flutter/material.dart';
import 'package:lab3/models/joke_model.dart';

class RandomJokeData extends StatelessWidget {
  final Joke joke;

  const RandomJokeData({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                joke.setup,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                joke.punchline,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.black54,
                ),
              ),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
