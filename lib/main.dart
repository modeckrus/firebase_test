import 'package:firebase_test/route_generator.dart';
import 'package:firebase_test/service/firebase_service.dart';
import 'package:flutter/material.dart';

void main() {
  FirebaseService.loadFromFile();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      onGenerateRoute: (settings) {
        return RouteGenerator.generateRoute(settings);
      },
      initialRoute: '/',
    );
  }
}
