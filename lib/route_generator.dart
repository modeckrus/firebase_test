import 'package:firebase_test/initial_page.dart';
import 'package:firebase_test/login_page.dart';
import 'package:firebase_test/register_page.dart';
import 'package:firebase_test/test_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => InitialPage(),
        );
        break;
      case '/login':
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
        break;
      case '/register':
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );
        break;
      case '/test':
        return MaterialPageRoute(
          builder: (context) => TestPage(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => InitialPage(),
        );
    }
  }
}
