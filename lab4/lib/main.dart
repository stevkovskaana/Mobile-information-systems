import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/exams_provider.dart';
import './screens/calendar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ExamsProvider(),
      child: MaterialApp(
        title: 'Examination Schedule',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const CalendarScreen(),
      ),
    );
  }
}
