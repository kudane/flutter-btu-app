import 'package:flutter/material.dart';

class CustomDropdownPicker extends StatelessWidget {
  EdgeInsets padding;
  String value;
  String labelText;
  String hintText;
  String errorText;
  List<String> items;
  ValueChanged<String> onChanged;
  FormFieldSetter<String> validator;
  FormFieldValidator<String> onSaved;

  CustomDropdownPicker({
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
    @required this.value,
    @required this.items,
    @required this.labelText,
    this.hintText = "",
    this.errorText,
    this.onChanged,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            errorText: errorText,
          ),
          value: value,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
