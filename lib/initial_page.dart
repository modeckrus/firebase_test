import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Initial Page'),
        ),
        body: Column(
          children: [
            RaisedButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            Divider(),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            Divider(),
            RaisedButton(
              child: Text('Test'),
              onPressed: () {
                Navigator.pushNamed(context, '/test');
              },
            ),
          ],
        ),
      ),
    );
  }
}
