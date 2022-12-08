import 'package:ev_ui/auth_wrapper.dart';
import 'package:ev_ui/dao/userDAO.dart';
import 'package:ev_ui/screens/history.dart';
import 'package:ev_ui/screens/homepage.dart';
import 'package:ev_ui/screens/navigation.dart';
import 'package:ev_ui/screens/profile.dart';
import 'package:ev_ui/screens/registration/pending.dart';
import 'package:ev_ui/screens/registration/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:ev_ui/screens/registration/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider<UserDAO>(
        create: (context) => UserDAO(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthWrapper(),
        ),
      );
    });
  }
}
