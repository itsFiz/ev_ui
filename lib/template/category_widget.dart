import 'package:ev_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget categoryButton(
    {required String typeImage,
    required String typeFacility,
    required Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
      width: 66.w,
      height: 32.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        color: primaryColor,
      ),
      // padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.sp),
              child: Image.asset(
                typeImage,
                height: 25.h,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
            child: Text(
              typeFacility,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp),
            ),
          ),
        ],
      ),
    ),
  );
}
