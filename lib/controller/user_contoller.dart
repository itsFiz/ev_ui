import 'dart:convert';
import 'dart:developer';

import 'package:ev_ui/services/globals.dart';
import 'package:http/http.dart';

class UserController {
  static Future<Map<String, dynamic>?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    String url = baseURL + 'auth/register';
    var response = await post(
      Uri.parse(url),
      body: jsonEncode(
        {
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
}
