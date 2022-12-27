import 'package:app_manage/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/splash/splash_screen.dart';
import '404.dart';

class RouterGenerator {
  //* Routing list
  static const routeHome = "/home";
  static const routeSplash = "/splash";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case routeHome:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        break;
    }
    return MaterialPageRoute(builder: (_) => WidgetNotFound());
  }
}
