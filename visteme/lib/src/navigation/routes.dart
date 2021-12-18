import 'package:flutter/material.dart';
import 'package:visteme/data/models/category_model.dart';
import 'package:visteme/presentation/pages/home/my_home.dart';
import 'package:visteme/presentation/pages/home/widgets/catalogo_screen.dart';
import 'package:visteme/presentation/pages/home/widgets/wishlist_screen.dart';
import 'package:visteme/presentation/pages/intro/intro_screen.dart';
import 'package:visteme/presentation/pages/login/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const home = '/home';
  static const blusa = '/blusa';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case home:
        return _buildRoute(MyHome.create);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      default:
        throw Exception('Route does not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
