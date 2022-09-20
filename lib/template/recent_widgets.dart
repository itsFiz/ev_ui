import 'package:ev_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sizer/sizer.dart';

Widget recentButton(
    {required Image pic,
    required String facilitiesName,
    required String facilitiesType}) {
  return GestureDetector(
    child: Container(
      width: 70.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    ),
  );
}
