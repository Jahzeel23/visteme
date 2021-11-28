import 'package:flutter/material.dart';
import 'package:visteme/presentation/ui/home/guardar_datos.dart';
import 'package:visteme/presentation/ui/home/home.dart';
import 'package:visteme/presentation/ui/login/intro_screen.dart';
import 'package:visteme/presentation/ui/login/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const home = '/home';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case home:
        return _buildRoute(Home.create);
      default:
        throw Exception('Route does not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
