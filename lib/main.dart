import 'package:flutter/material.dart';
import 'router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: new TextTheme(
          title: new TextStyle(
            color: Colors.white,
            fontFamily: "Sarabun",
          ),
          caption: new TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontFamily: "Sarabun",
          ),
          body1: new TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontFamily: "Sarabun",
          ),
          body2: new TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Sarabun",
          ),
        ),
      ),
      routes: Router.routes,
      initialRoute: Router.SPLASH_PAGE,
    );
  }
}
