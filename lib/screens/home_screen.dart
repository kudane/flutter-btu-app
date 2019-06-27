import 'package:flutter/material.dart';
import '../models/index.dart';
import '../widgets/index.dart';
import '../utils/index.dart';

class HomeScreen extends StatefulWidget {
  final String title = Language.appName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = new ScrollController();
  final _room = Room();

  String _dropdownValue = Room.getTypes()[0];
  bool _switchValue = false;
  int _btu = 0;

  @override
  void dispose() {
    _formKey.currentState.dispose();
    _scaffoldKey.currentState.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _calculator() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      int newBtu = 0;

      if (_switchValue) {
        newBtu = _room.getBtuBy3D();
      } else {
        newBtu = _room.getBtuBy2D();
      }

      _scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );

      //dot't show "SnackBar" in duplicate "_btu"
      if (_btu == newBtu) {
        return;
      }

      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(Language.success),
        duration: Duration(seconds: 1),
      ));

      setState(() {
        _btu = newBtu;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.title),
      ),
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          CustomShowBTU(
            btu: _btu,
            bgColor: Theme.of(context).accentColor,
            height: MediaQuery.of(context).size.height / 6,
          ),
          Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    CustomTextTitle(
                      text: Language.roomSize,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    CustomTextField(
                      labelText: Language.roomWidth,
                      hintText: Language.roomUnit,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return dataEmptyError();
                        }
                        if (value == "0") {
                          return dataNotZeroError(Language.roomWidth);
                        }
                        if (!isNumeric(value)) {
                          return dataInvalidError(value);
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _room.width = double.parse(value);
                      },
                    ),
                    CustomTextField(
                      labelText: Language.roomHeight,
                      hintText: Language.roomUnit,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return dataEmptyError();
                        }
                        if (value == "0") {
                          return dataNotZeroError(Language.roomHeight);
                        }
                        if (!isNumeric(value)) {
                          return dataInvalidError(value);
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _room.height = double.parse(value);
                      },
                    ),
                    CustomEnableSwitch(
                      value: _switchValue,
                      title: Language.switchHeightTitle,
                      onChanged: (bool newValue) {
                        setState(() {
                          _switchValue = newValue;
                        });
                      },
                    ),
                    CustomTextField(
                      labelText: Language.roomLength,
                      hintText: Language.roomUnit,
                      enabled: _switchValue,
                      validator: (String value) {
                        if (_switchValue) {
                          if (value == "0") {
                            return dataNotZeroError(Language.roomLength);
                          }
                          if (value.isEmpty) {
                            return dataInvalidError(value);
                          }
                          if (!isNumeric(value)) {
                            return dataInvalidError(value);
                          }
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _room.length =
                            double.parse(value.isEmpty ? "1" : value);
                      },
                    ),
                    CustomTextTitle(
                      text: Language.roomType,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    CustomDropdownPicker(
                      labelText: Language.typeDetail,
                      value: _dropdownValue,
                      items: Room.getTypes(),
                      onChanged: (String value) {
                        setState(() {
                          _dropdownValue = value;
                        });
                      },
                      onSaved: (String value) {
                        _room.type = value;
                      },
                    ),
                    Container(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculator,
        tooltip: Language.calculate,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
