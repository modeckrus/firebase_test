import 'package:firebase_test/pages/error_page.dart';
import 'package:firebase_test/pages/initial_page.dart';
import 'package:firebase_test/pages/login_page.dart';
import 'package:firebase_test/pages/register_page.dart';
import 'package:firebase_test/pages/test_page.dart';
import 'package:flutter/material.dart';

import 'service/route_transitions.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageRouteTransition(
            builder: (_) => InitialPage(),
            animationType: AnimationType.slide_right,
            curves: Curves.easeInOut);
        break;
      case '/login':
        return PageRouteTransition(
            builder: (_) => LoginPage(),
            animationType: AnimationType.slide_right,
            curves: Curves.easeInOut);
        break;
      case '/register':
        return PageRouteTransition(
            builder: (_) => RegisterPage(),
            animationType: AnimationType.slide_right,
            curves: Curves.easeInOut);
        break;
      case '/test':
        return PageRouteTransition(
            builder: (_) => TestPage(),
            animationType: AnimationType.slide_right,
            curves: Curves.easeInOut);
        break;
      default:
        return PageRouteTransition(
            builder: (_) => ErrorPage(
                  error: 'No such Page',
                ),
            animationType: AnimationType.slide_right,
            curves: Curves.easeInOut);
        break;
    }
  }
}
