import 'package:flutter/material.dart';
import '../models/index.dart';

class CustomShowBTU extends StatelessWidget {
  EdgeInsets padding;
  Color bgColor;
  double width;
  double height;
  Alignment alignment;
  int btu;

  CustomShowBTU({
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
    this.bgColor,
    this.width,
    this.height,
    this.alignment = Alignment.centerLeft,
    @required this.btu,
  });

  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: bgColor,
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.width,
      child: Align(
        alignment: alignment,
        child: Container(
          width: width,
          child: Text("${Language.btu} $btu"),
        ),
      ),
    );
  }
}
