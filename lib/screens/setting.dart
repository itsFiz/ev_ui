import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/screens/homepage.dart';
import 'package:ev_ui/screens/notif.dart';
import 'package:ev_ui/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class Setting extends StatefulWidget {
  final void Function() openDrawer;

  const Setting({Key? key, required this.openDrawer}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  AppBar appBar() => AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.sp),
                bottomRight: Radius.circular(15.sp))),
        backgroundColor: secondaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Ionicons.menu_outline),
          onPressed: () {
            widget.openDrawer();
          },
        ),
        title: Text('Setting'),
      );
}
