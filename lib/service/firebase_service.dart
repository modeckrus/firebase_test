import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class FirebaseService {
  // api and urls
  static const String projectId = 'testplatform-modeck';
  static const String apiKey = 'AIzaSyACE4LOeZ7e6hg2Q3dPaxDhz4y6n97gjmo';
  static final register_url =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$apiKey';
  static final login_url =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=$apiKey';
  static final firestore_url =
      'https://firestore.googleapis.com/v1/projects/$projectId/databases/(default)/documents/';
  // static final mask_url = '';
  //  User
  static String currentToken;
  static bool isAuth = false;
  static AuthUser user;
  //
  static String status;
  //  Private
  static File _file = File('./settings.json');
  //  Stream
  static Stream<String> get notification =>
      _notificationController.stream.asBroadcastStream();
  static final StreamController<String> _notificationController =
      StreamController<String>();
  //  private functions
  static String _getTokenIdFromResult(http.Response result) {
    print(result.body);
    user = AuthUser.fromJson(jsonDecode(result.body));
    return user.idToken;
  }

  static Map<String, String> _getRequestHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${user.idToken}',
    };
  }

  static Future<void> saveToFile() async {
    final json = {'isAuth': isAuth, 'user': user, 'status': 'zalupa'};
    final content = jsonEncode(json);
    _file = await _file.writeAsString(content);
  }

  static Future<void> loadFromFile() async {
    final content = await _file.readAsString();
    final json = jsonDecode(content);
    isAuth = json['isAuth'];
    user = AuthUser.fromJson(json['user']);
    status = json['zalupa'];
  }
  //Public fields

  static Future<void> register(String email, String password) async {
    final body = {
      'email': email,
      'password': password,
    };
    final result = await http.post(register_url, body: jsonEncode(body));
    print('Result: $result');
    if (result.statusCode == 200) {
      currentToken = _getTokenIdFromResult(result);
      _notificationController.add('Register Success');
      saveToFile();
    } else {
      print('Error: ${result.body}');
      _notificationController.add('Register Failed: ${result.body}');
    }
  }

  static Future<void> login(String email, String password) async {
    final body = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final result = await http.post(login_url, body: jsonEncode(body));
    print('Result: $result');
    if (result.statusCode == 200) {
      currentToken = _getTokenIdFromResult(result);
      _notificationController.add('Login Success');
      saveToFile();
    } else {
      print('Error: ${result.body}');
      _notificationController.add('Login Failed: ${result.body}');
    }
  }

  static Future<String> getDocument(String path) async {
    final url = firestore_url + path;
    final response = await http.get(url, headers: _getRequestHeaders());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Error{getDocument}: ${response.body}');
      return null;
    }
  }

  static saveDocument(String path, Map<String, dynamic> fields) async {
    final document = jsonEncode({
      'fields': fields,
    });
    final url = firestore_url + path;
    http.post(url, headers: _getRequestHeaders(), body: document);
  }

  static updateDocument(String path, Map<String, dynamic> fields) {}

  static deleteDocument(String path) {}
}

class AuthUser {
  String kind;
  String idToken;
  String email;
  String refreshToken;
  String expiresIn;
  String localId;

  AuthUser(
      {this.kind,
      this.idToken,
      this.email,
      this.refreshToken,
      this.expiresIn,
      this.localId});

  AuthUser.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    idToken = json['idToken'];
    email = json['email'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
    localId = json['localId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['idToken'] = this.idToken;
    data['email'] = this.email;
    data['refreshToken'] = this.refreshToken;
    data['expiresIn'] = this.expiresIn;
    data['localId'] = this.localId;
    return data;
  }
}
