import 'package:ev_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

AppBar templateAppBar({
  required String barName,
}) {
  return AppBar(
      backgroundColor: secondaryColor,
      elevation: 0,
      centerTitle: true,
      title: Text(barName),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.sp),
              bottomRight: Radius.circular(15.sp))));
}
