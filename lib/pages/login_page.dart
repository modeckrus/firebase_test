import 'dart:async';

import 'package:firebase_test/service/firebase_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Divider(),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  FirebaseService.login(
                      _emailController.text, _passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
