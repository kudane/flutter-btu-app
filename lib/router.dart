import 'package:flutter/material.dart';
import './screens/index.dart';
import './transitions/index.dart';

class Router {
  static const String SPLASH_PAGE = "SPLASH_PAGE";
  static const String HOME_PAGE = "HOME_PAGE";

  static Map<String, WidgetBuilder> routes = {
    SPLASH_PAGE: (context) => getPage(SPLASH_PAGE),
    HOME_PAGE: (context) => getPage(HOME_PAGE),
  };

  static Widget getPage(String page) {
    switch (page) {
      case HOME_PAGE:
        {
          return HomeScreen();
        }
      case SPLASH_PAGE:
      default:
        {
          return SplashScreen();
        }
    }
  }

  static PageRouteBuilder fade(String page) {
    return FadeRouteBuilder(
      page: getPage(page),
    );
  }
}
