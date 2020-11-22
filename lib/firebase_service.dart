import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class FirebaseService {
  static const String projectId = 'testplatform-modeck';
  static const String apiKey = 'AIzaSyACE4LOeZ7e6hg2Q3dPaxDhz4y6n97gjmo';
  static final register_url =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$apiKey';
  static final login_url =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=$apiKey';
  static final firestore_url =
      'https://firestore.googleapis.com/v1/projects/$projectId/databases/(default)/documents/';
  // static Map<String, dynamic> user_info;
  static String currentToken;
  static bool isAuth = false;
  static RegistredUser registredUser;
  static Stream<String> get notification =>
      _notificationController.stream.asBroadcastStream();
  static final StreamController<String> _notificationController =
      StreamController<String>();
  static String _getTokenIdFromResult(http.Response result) {
    print(result.body);
    registredUser = RegistredUser.fromJson(jsonDecode(result.body));
    return registredUser.idToken;
  }

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
    } else {
      print('Error: ${result.body}');
      _notificationController.add('Login Failed: ${result.body}');
    }
  }
//   func save_document(path: String, fields: Dictionary, http: HTTPRequest) -> void:
// 	var document := { "fields": fields }
// 	var body := to_json(document)
// 	var url := FIRESTORE_URL + path
// 	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_POST, body)

// func get_document(path: String, http: HTTPRequest) -> void:
// 	var url := FIRESTORE_URL + path
// 	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_GET)

// func update_document(path: String, fields: Dictionary, http: HTTPRequest) -> void:
// 	var document := { "fields": fields }
// 	var body := to_json(document)
// 	var url := FIRESTORE_URL + path
// 	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_PATCH, body)

// func delete_document(path: String, http: HTTPRequest) -> void:
// 	var url := FIRESTORE_URL + path
// 	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_DELETE)
  Map<String, String> _getRequestHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${registredUser.idToken}"',
    };
  }

  Future<String> getDocument(String path) async {
    final url = firestore_url + path;
    final response = await http.get(url, headers: _getRequestHeaders());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Error{getDocument}: ${response.body}');
      return null;
    }
  }

  saveDocument(String path, Map<String, dynamic> fields) async {
    final document = jsonEncode({
      'fields': fields,
    });
    final url = firestore_url + path;
    http.post(url, headers: _getRequestHeaders(), body: document);
  }

  updateDocument(String path, Map<String, dynamic> fields) {}

  deleteDocument(String path) {}
}

class RegistredUser {
  String kind;
  String idToken;
  String email;
  String refreshToken;
  String expiresIn;
  String localId;

  RegistredUser(
      {this.kind,
      this.idToken,
      this.email,
      this.refreshToken,
      this.expiresIn,
      this.localId});

  RegistredUser.fromJson(Map<String, dynamic> json) {
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
