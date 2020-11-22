import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String error;
  ErrorPage({Key key, this.error}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Error Page'),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [Text(widget.error ?? 'No such page')],
        ),
      ),
    );
  }
}
