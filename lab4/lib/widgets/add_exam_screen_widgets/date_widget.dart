import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateUpdated;

  const DateField({
    super.key,
    required this.selectedDate,
    required this.onDateUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Date: ${selectedDate.toLocal().toString().split(' ')[0]}',
          ),
        ),
        TextButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
            );

            if (pickedDate != null && pickedDate != selectedDate) {
              onDateUpdated(pickedDate);
            }
          },
          child: const Text('Select Date'),
        ),
      ],
    );
  }
}
