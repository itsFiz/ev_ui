import 'dart:developer';
import 'package:ev_ui/dao/userDAO.dart';
import 'package:ev_ui/models/user.dart';
import 'package:ev_ui/screens/home.dart';
import 'package:ev_ui/screens/homepage.dart';
import 'package:ev_ui/screens/navigation.dart';
import 'package:ev_ui/screens/registration/pending.dart';
import 'package:ev_ui/screens/registration/sign_in.dart';
import 'package:ev_ui/screens/registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDAO>(
      builder: (context, userDAO, child) {
        if (userDAO.user == null) {
          return SignIn();
        } else if (userDAO.user!.verified == false) {
          return Pending();
        }
        return Nav();
      },
    );
  }
}
