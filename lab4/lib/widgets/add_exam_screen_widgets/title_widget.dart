import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  final FormFieldSetter<String>? title;

  const TitleField({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Title',
      ),
      onSaved: title,
    );
  }
}
