import 'package:flutter/material.dart';
import '../../screens/add_exam_screen.dart';

class AddExamButton extends StatelessWidget {
  final DateTime? selectedDate;

  const AddExamButton({super.key, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => AddExamScreen(initialSelectedDate: selectedDate),
          ),
        );
      },
      child: const Icon(Icons.add_circle),
    );
  }
}
