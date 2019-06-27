import 'package:flutter/material.dart';

class CustomTextTitle extends StatelessWidget {
  EdgeInsets padding;
  Alignment alignment;
  String text;
  TextStyle style;
  TextAlign textAlign;

  CustomTextTitle({
    this.padding = const EdgeInsets.fromLTRB(16, 24, 16, 8),
    this.alignment = Alignment.centerLeft,
    @required this.text,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          style: style,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
