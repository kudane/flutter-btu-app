import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  EdgeInsets padding;
  String labelText;
  String hintText;
  String errorText;
  bool enabled;
  bool autoValidate;
  String initialValue;
  TextInputType keyboardType;
  ValueChanged<String> onFieldSubmitted;
  FormFieldSetter<String> validator;
  FormFieldValidator<String> onSaved;

  CustomTextField({
    this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 8),
    @required this.labelText,
    this.hintText = "",
    this.errorText,
    this.enabled = true,
    this.keyboardType = TextInputType.number,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.autoValidate = true,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        initialValue: initialValue,
        autovalidate: autoValidate,
        enabled: enabled,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
        ),
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
