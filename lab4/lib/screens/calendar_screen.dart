import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/exams_provider.dart';
import '../widgets/calendar_screen_widgets/add_exam_button.dart';
import '../widgets/calendar_screen_widgets/delete_exam_button.dart';
import '../widgets/calendar_screen_widgets/map_button.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    final examsProvider = Provider.of<ExamsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Examination Schedule'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            selectedDayPredicate: (date) => isSameDay(_selectedDate, date),
            onDaySelected: (selectedDate, focusedDay) {
              setState(() {
                _selectedDate = selectedDate;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (date) => examsProvider.getExamsForDate(date),
          ),
          Expanded(
            child: _selectedDate == null
                ? const Center(child: Text('Select date!'))
                : ListView(
                    children: examsProvider
                        .getExamsForDate(_selectedDate!)
                        .map(
                          (exam) => ListTile(
                            title: Text(
                              exam.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${exam.dateTime.hour}:${exam.dateTime.minute.toString()} ${exam.locationName}',
                            ),
                            trailing: DeleteExamButton(examId: exam.id),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 45,
            child: MapButton(selectedDate: _selectedDate),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: AddExamButton(selectedDate: _selectedDate),
          ),
        ],
      ),
    );
  }
}
