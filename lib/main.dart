import 'package:firebase_test/pages/error_page.dart';
import 'package:firebase_test/route_generator.dart';
import 'package:firebase_test/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'pages/loading_page.dart';
import 'service/notification_service.dart';

void main() async {
  await FirebaseService.init();
  final not = await NotificationService.init();
  runApp(MyApp(
    notification: not,
  ));
}

class MyApp extends StatelessWidget {
  final NotificationAppLaunchDetails notification;

  const MyApp({Key key, @required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      onGenerateRoute: (settings) {
        return RouteGenerator.generateRoute(settings, notification);
      },
      initialRoute: '/',
    );
  }
}
