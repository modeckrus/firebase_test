import 'dart:io';

import 'package:firebase_test/service/hive_store.dart';
import 'package:firedart/auth/user_gateway.dart';
import 'package:firedart/firedart.dart';
import 'package:hive/hive.dart';

class FirebaseService {
  static const String projectId = 'testplatform-modeck';
  static const String apiKey = 'AIzaSyACE4LOeZ7e6hg2Q3dPaxDhz4y6n97gjmo';
  static User user;
  static Future<int> init() async {
    final path = Directory.current.path;
    Hive.init(path);

    Hive.registerAdapter(TokenAdapter());
    FirebaseAuth.initialize(apiKey, await HiveStore.create());
    Firestore.initialize(projectId);
    // await FirebaseAuth.instance.signIn('huis@gmail.com', '12345678');
    // user = await FirebaseAuth.instance.getUser();
    return 1;
  }

  static Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signIn(email, password);
      user = await FirebaseAuth.instance.getUser();
      print('Login success: ${user.toString()}');
    } catch (e) {
      print('Error login: ${e.toString()}');
    }
  }

  static Future<void> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.signUp(email, password);
      user = await FirebaseAuth.instance.getUser();
      print('Register success: ${user.toString()}');
    } catch (e) {
      print('Error login: ${e.toString()}');
    }
  }
}
