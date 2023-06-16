import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  final http.Client client;

  ApiProvider({required this.client});

  Future<Login> fetchLogin(String email, password) async {
    final response = await client.get(Uri.parse(
        'http://techtest.youapp.ai/api/login?email=$email&password=$password'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Login.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to Login');
    }
  }
}

class Login {
  final String message;

  Login({
    required this.message,
  });
  static Login fromJson(Map<String, dynamic> map) {
    return Login(
      message: map['message'],
    );
  }
}
