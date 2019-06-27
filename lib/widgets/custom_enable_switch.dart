import 'package:flutter/material.dart';

class CustomEnableSwitch extends StatelessWidget {
  EdgeInsets padding;
  bool value;
  String title;
  ValueChanged<bool> onChanged;

  CustomEnableSwitch({
    this.padding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
    @required this.value,
    @required this.title,
    @required this.onChanged,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Column(
        children: <Widget>[
          new SwitchListTile(
            value: value,
            onChanged: onChanged,
            title: new Text('คำนวณด้วยความสูง'),
          )
        ],
      ),
    );
  }
}
