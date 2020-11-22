import 'package:firebase_test/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// const API_KEY := "[ENTER API KEY]"
// const PROJECT_ID := "[ENTER PROJECT ID]"

// const REGISTER_URL := "https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=%s" % API_KEY
// const LOGIN_URL := "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=%s" % API_KEY
// const FIRESTORE_URL := "https://firestore.googleapis.com/v1/projects/%s/databases/(default)/documents/" % PROJECT_ID

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (settings) {
        return RouteGenerator.generateRoute(settings);
      },
      initialRoute: '/',
    );
  }
}
