import 'package:firebase_test/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Create file'),
              RaisedButton(
                child: Text('Create file'),
                onPressed: () async {
                  var file = File('./superyazza.txt');
                  file = await file.create();
                  await file.writeAsString('contents');
                  print('done');
                  print(file.absolute.path);
                },
              ),
              Divider(),
              Text('Get document'),
              RaisedButton(
                child: Text('get'),
                onPressed: () async {
                  final string = await FirebaseService.getDocument('huis/huis');
                  print('Done: $string');
                },
              ),
              Divider(),
              Text(FirebaseService.status ?? 'Status: no'),
            ],
          ),
        ),
      ),
    );
  }
}
