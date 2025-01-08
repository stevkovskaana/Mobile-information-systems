import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../models/exam_model.dart';
import '../providers/exams_provider.dart';
import '../widgets/add_exam_screen_widgets/location_picker_widget.dart';
import '../widgets/add_exam_screen_widgets/time_widget.dart';
import '../widgets/add_exam_screen_widgets/title_widget.dart';
import '../widgets/add_exam_screen_widgets/date_widget.dart';
import '../widgets/add_exam_screen_widgets/location_name_widget.dart';

class AddExamScreen extends StatefulWidget {
  final DateTime? initialSelectedDate;

  const AddExamScreen({super.key, this.initialSelectedDate});

  @override
  _AddExamScreenState createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  late DateTime _selectedDate;
  int? _selectedHour;
  int? _selectedMinutes;
  String _locationName = '';
  LatLng? _location;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialSelectedDate ?? DateTime.now();
  }

  void _fieldsValidation() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    if (_title.isEmpty ||
        _locationName.isEmpty ||
        _location == null ||
        _selectedHour == null ||
        _selectedMinutes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required!')),
      );
      return;
    }
  }

  DateTime createDateTime(
      DateTime selectedDate, int selectedHour, int selectedMinute) {
    return DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedHour,
      selectedMinute,
    );
  }

  Exam createExam(
      String title, DateTime dateTime, LatLng location, String locationName) {
    return Exam(
      id: UniqueKey().toString(),
      title: title,
      dateTime: dateTime,
      location: location,
      locationName: locationName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TitleField(
                title: (value) => _title = value!,
              ),
              DateField(
                selectedDate: _selectedDate,
                onDateUpdated: (value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
              TimeField(
                selectedHour: _selectedHour,
                selectedMinutes: _selectedMinutes,
                onHourUpdated: (value) {
                  setState(() {
                    _selectedHour = value;
                  });
                },
                onMinutesUpdated: (value) {
                  setState(() {
                    _selectedMinutes = value;
                  });
                },
              ),
              LocationNameField(
                locationName: _locationName,
                onLocationNameUpdated: (value) {
                  setState(() {
                    _locationName = value;
                  });
                },
              ),
              LocationPicker(
                location: _location,
                onLocationPicked: (pickedLocation) {
                  setState(() {
                    _location = pickedLocation;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _fieldsValidation();
                  DateTime dateTime = createDateTime(
                      _selectedDate, _selectedHour!, _selectedMinutes!);
                  Exam exam =
                      createExam(_title, dateTime, _location!, _locationName);
                  Provider.of<ExamsProvider>(context, listen: false)
                      .addExam(exam);
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
