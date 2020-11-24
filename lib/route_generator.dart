import 'dart:io';

import 'package:firebase_test/pages/error_page.dart';
import 'package:firebase_test/pages/initial_page.dart';
import 'package:firebase_test/pages/login_page.dart';
import 'package:firebase_test/pages/register_page.dart';
import 'package:firebase_test/pages/scrollable_page.dart';
import 'package:firebase_test/pages/test_page.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'pages/notification_initial_page.dart';
import 'service/notification_service.dart';
import 'service/route_transitions.dart';

class RouteGenerator {
  static bool isMounted = false;
  static Route<dynamic> generateRoute(RouteSettings settings,
      NotificationAppLaunchDetails notificationAppLaunchDetails) {
    if (!isMounted) {
      Firestore.instance.collection('notify').stream.listen((document) {
        NotificationService.sendNotification(ReceivedNotification(
            id: Platform.numberOfProcessors,
            title: document.last.map['title'] ?? 'title',
            body: document.last.map['title'] ?? 'body',
            payload: document.last.map['title'] ?? 'Payload'));
      });
      isMounted = true;
    }
    switch (settings.name) {
      case '/':
        if (notificationAppLaunchDetails.didNotificationLaunchApp) {
          return PageRouteTransition(
              builder: (_) => NotificationInitialPage(
                    notificationAppLaunchDetails: notificationAppLaunchDetails,
                  ),
              animationType: AnimationType.slide_right,
              curves: Curves.easeInOut);
        } else {
          return PageRouteTransition(
              builder: (_) => InitialPage(),
              animationType: AnimationType.slide_right,
              curves: Curves.easeInOut);
        }
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
      case '/scrollable':
        return PageRouteTransition(
            builder: (_) => ScrollablePage(),
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
