import 'package:flutter/material.dart';
import 'dart:async';
import '../models/index.dart';
import '../router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pushReplacement(
      context,
      Router.fade(Router.HOME_PAGE),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/icons8-air-filled-100.png', //by icon8
                fit: BoxFit.contain,
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
