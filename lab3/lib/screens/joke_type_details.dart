import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab3/models/joke_model.dart';
import 'package:lab3/services/api_service.dart';

import '../widgets/joke_type_details/detail_back_button.dart';
import '../widgets/joke_type_details/detail_data.dart';
import '../widgets/joke_type_details/detail_title.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Joke> jokes = [];
  bool isLoading = true;

  String jokeType = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as String;
    jokeType = arguments;
    print("jokeType: $jokeType");
    if (jokeType.isNotEmpty) {
      getJokes(jokeType);
    }
  }

  void getJokes(String type) async {
    ApiService.getJokesForTypeFromAPI(type).then((response) {
      var data = List<Joke>.from(json
          .decode(response.body)
          .map((jokeJson) => Joke.fromJson(jokeJson)));
      setState(() {
        jokes = data;
        isLoading = false;
      });
    }).catchError((error) {
      print("Error: $error");
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: DetailTitle(type: jokeType),
            ),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: DetailData(jokes: jokes),
              ),
          ],
        ),
      ),
      floatingActionButton: const DetailBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
