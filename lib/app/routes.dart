import 'package:droos_online/features/auth/screens/login_screen.dart';
import 'package:droos_online/features/landing/ui/landing_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String landing = '/';
  static const String login = '/login';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
