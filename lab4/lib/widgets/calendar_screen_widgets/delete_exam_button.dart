import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/exams_provider.dart';

class DeleteExamButton extends StatelessWidget {
  final String examId;

  const DeleteExamButton({super.key, required this.examId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        Provider.of<ExamsProvider>(context, listen: false).removeExam(examId);
      },
    );
  }
}
