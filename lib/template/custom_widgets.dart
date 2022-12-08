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
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.sp)),
      child: Container(
        height: 20.h,
        width: 23.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          color: primaryColor,
          // boxShadow: [
          //   BoxShadow(blurRadius: 6.sp, offset: Offset(0, 2)),
          // ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 30.sp,
            ),
            Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            ),
          ],
        ),
      ),
    ),
  );
}
