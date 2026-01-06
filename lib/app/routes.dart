import 'package:droos_online/features/auth/screens/login_screen.dart';
import 'package:droos_online/features/dashBoard/screens/dashboard_screen.dart';
import 'package:droos_online/features/home/screen/home_screen.dart';
import 'package:droos_online/features/landing/ui/landing_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String landing = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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
