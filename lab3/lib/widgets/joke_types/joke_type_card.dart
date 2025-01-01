import 'package:flutter/material.dart';

class JokeTypeCard extends StatelessWidget {
  final String jokeType;

  const JokeTypeCard({super.key, required this.jokeType});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.deepPurple[50],
        onTap: () {
          Navigator.pushNamed(context, '/details', arguments: jokeType);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              border: Border.all(
                  color: Colors.deepPurple.withOpacity(0.8), width: 2),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              jokeType,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
