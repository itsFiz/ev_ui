import 'package:ev_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sizer/sizer.dart';

Widget facilityButton(
    {required IconData iconData,
    required String label,
    required Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 30.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        color: primaryColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 30.sp,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
