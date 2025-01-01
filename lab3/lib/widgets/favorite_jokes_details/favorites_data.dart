import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/jokes_provider.dart';
import 'favorites_button.dart';

class FavoritesData extends StatelessWidget {
  const FavoritesData({super.key});

  @override
  Widget build(BuildContext context) {
    final jokesProvider = Provider.of<JokesProvider>(context);

    return jokesProvider.favoriteJokes.isEmpty
        ? const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Text(
          "No favorite jokes yet!",
          style: TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
        ),
      ),
    )
        : Expanded(
      child: ListView.builder(
        itemCount: jokesProvider.favoriteJokes.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                jokesProvider.favoriteJokes[index].setup,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                jokesProvider.favoriteJokes[index].punchline,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              trailing: FavoritesButton(joke: jokesProvider.favoriteJokes[index])
            ),
          );
        },
      ),
    );
  }
}