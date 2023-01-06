import 'dart:convert';
import 'dart:developer';

import 'package:ev_ui/services/globals.dart';
import 'package:http/http.dart';

class UserController {
  static Future<Map<String, dynamic>?> getUser({required String token}) async {
    String url = baseURL + 'auth/user/';
    var response = await get(
      Uri.parse(url),
      headers: headersWithToken(token),
    );
    log(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
  }

  static Future<Map<String, dynamic>?> register({
    required String idNo,
    required String name,
    required String email,
    required String password,
  }) async {
    String url = baseURL + 'auth/register/';
    var response = await post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'identity_no': idNo,
          'name': name,
          'email': email,
          'password': password,
        },
      ),
      headers: headersWithoutToken,
    );
    log(response.body);
    if (response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }

    return null;
  }

  static Future<Map<String, dynamic>?> login({
    required String identity_no,
    required String password,
  }) async {
    String url = baseURL + 'auth/login/';
    var response = await post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'identity_no': identity_no,
          'password': password,
        },
      ),
      headers: headersWithoutToken,
    );
    log(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }

    return null;
  }

  static Future<bool> logout(String token) async {
    String url = baseURL + 'auth/logout/';
    var response = await post(
      Uri.parse(url),
      headers: headersWithToken(token),
    );
    log(response.body);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
