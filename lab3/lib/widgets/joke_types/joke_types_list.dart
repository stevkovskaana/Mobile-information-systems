import 'package:flutter/material.dart';
import 'package:lab3/widgets/joke_types/joke_type_card.dart';

class JokeTypesList extends StatefulWidget {
  final List<String> jokeTypes;

  const JokeTypesList({super.key, required this.jokeTypes});

  @override
  State<JokeTypesList> createState() => _JokeTypesListState();
}

class _JokeTypesListState extends State<JokeTypesList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(4),
      children: widget.jokeTypes.map((jokeType) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: JokeTypeCard(jokeType: jokeType),
        );
      }).toList(),
    );
  }
}
