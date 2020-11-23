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
            ListTile(
              trailing: Icon(Icons.navigate_next),
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Register'),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Login'),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.navigate_next),
              leading: Icon(Icons.adb),
              title: Text('Test'),
              onTap: () {
                Navigator.pushNamed(context, '/test');
              },
            ),
          ],
        ),
      ),
    );
  }
}
