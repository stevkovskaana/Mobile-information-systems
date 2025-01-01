import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab3/providers/jokes_provider.dart';
import 'package:lab3/screens/favorites.dart';
import 'package:lab3/screens/home.dart';
import 'package:lab3/screens/joke_type_details.dart';
import 'package:lab3/screens/random_joke.dart';
import 'package:lab3/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initialize();
  runApp(
    ChangeNotifierProvider(
      create: (_) => JokesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JokesApp',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/details": (context) => const Details(),
        "/random-joke": (context) => const RandomJoke(),
        "/favorites": (context) => const FavoriteJokes(),
      },
    );
  }
}
