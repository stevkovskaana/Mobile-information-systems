import 'package:flutter/material.dart';
import '../models/exam_model.dart';

class ExamsProvider extends ChangeNotifier {
  final List<Exam> _exams = [];

  List<Exam> get exams => [..._exams];

  void addExam(Exam exam) {
    _exams.add(exam);
    notifyListeners();
  }

  void removeExam(String examId) {
    _exams.removeWhere((exam) => exam.id == examId);
    notifyListeners();
  }

  List<Exam> getExamsForDate(DateTime date) {
    return _exams
        .where((exam) =>
            exam.dateTime.year == date.year &&
            exam.dateTime.month == date.month &&
            exam.dateTime.day == date.day)
        .toList();
  }
}
