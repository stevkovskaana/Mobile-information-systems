import 'package:flutter/material.dart';

class TimeField extends StatelessWidget {
  final int? selectedHour;
  final int? selectedMinutes;
  final ValueChanged<int?> onHourUpdated;
  final ValueChanged<int?> onMinutesUpdated;

  const TimeField({
    super.key,
    required this.selectedHour,
    required this.selectedMinutes,
    required this.onHourUpdated,
    required this.onMinutesUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Time:'),
        Row(
          children: [
            DropdownButton<int>(
              value: selectedHour,
              hint: const Text('HH'),
              items: List.generate(24, (index) {
                return DropdownMenuItem(
                  value: index,
                  child: Text(index.toString().padLeft(2, '0')),
                );
              }),
              onChanged: onHourUpdated,
            ),
            const Text(' : '),
            DropdownButton<int>(
              value: selectedMinutes,
              hint: const Text('MM'),
              items: List.generate(60, (index) {
                return DropdownMenuItem(
                  value: index,
                  child: Text(index.toString().padLeft(2, '0')),
                );
              }),
              onChanged: onMinutesUpdated,
            ),
          ],
        ),
      ],
    );
  }
}
