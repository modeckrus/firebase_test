import 'package:firebase_test/pages/error_page.dart';
import 'package:firebase_test/pages/initial_page.dart';
import 'package:firebase_test/route_generator.dart';
import 'package:firebase_test/service/firebase_service.dart';
import 'package:firebase_test/service/new_firebase_service.dart';
import 'package:flutter/material.dart';

import 'pages/loading_page.dart';

void main() async {
  await FirebaseService.init();
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
    return FutureBuilder(
      future: FirebaseService.init(),
      builder: (context, snap) {
        if (snap.hasError) {
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.dark,
            home: ErrorPage(
              error: snap.error.toString(),
            ),
          );
        }
        if (!snap.hasData) {
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.dark,
            home: LoadingPage(),
          );
        }
        return MaterialApp(
          title: 'Flutter Demo',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          onGenerateRoute: (settings) {
            return RouteGenerator.generateRoute(settings);
          },
          initialRoute: '/',
        );
        // return MaterialApp(
        //   title: 'Flutter Demo',
        //   darkTheme: ThemeData.dark(),
        //   themeMode: ThemeMode.dark,
        //   home: InitialPage(),
        // );
      },
    );
  }
}
