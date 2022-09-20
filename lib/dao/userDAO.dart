import 'package:ev_ui/controller/user_contoller.dart';
import 'package:ev_ui/models/user.dart';
import 'package:flutter/material.dart';

class UserDAO extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic>? data = await UserController.register(
        name: name, email: email, password: password);

    if (data != null) {
      User u = User.fromMap(data);
      _user = u;
      notifyListeners();
      return true;
    }
    return false;
  }
}
