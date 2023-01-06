import 'dart:developer';
import 'package:ev_ui/controller/user_contoller.dart';
import 'package:ev_ui/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserDAO extends ChangeNotifier {
  final _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));
  User? _user;

  User? get user => _user;

  init() async {
    String? token = await _storage.read(key: 'token');

    if (token != null) {
      Map<String, dynamic>? data = await UserController.getUser(token: token);

      if (data != null) {
        User u = User.fromMap(data);
        _user = u;
        notifyListeners();
      } else {
        _storage.delete(
            key: 'token'); //del from flutter secure storage, local phone
        _user = null;
        notifyListeners();
      }
    }
  }

  UserDAO() {
    init();
  }

  Future<bool> register({
    required String idno,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic>? data = await UserController.register(
          idNo: idno, name: name, email: email, password: password);

      if (data != null) {
        await _storage.write(key: 'token', value: data['token']);
        User u = User.fromMap(data);
        _user = u;
        log('register');
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  Future<bool> login({
    required String identityNo,
    required String password,
  }) async {
    Map<String, dynamic>? data =
        await UserController.login(identity_no: identityNo, password: password);

    if (data != null) {
      await _storage.write(key: 'token', value: data['token']);
      User u = User.fromMap(data);
      _user = u;
      log(data.toString());
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    String? token = await _storage.read(key: 'token');
    if (token != null) {
      bool res = await UserController.logout(token);

      if (res == true) {
        _storage.delete(
            key: 'token'); //del from flutter secure storage, local phone
        _user = null;
        notifyListeners();
      }
    }
  }
}
