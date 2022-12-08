import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/template/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: templateAppBar(barName: 'Notifications'),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 3.h),
        width: 100.w,
        child: Column(
          children: [
            Container(
              height: 14.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.sp)),
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Soccer Table - Games Area',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w800,
                        color: tertiaryColor),
                  ),
                  Text(
                    'Your booking #1684634 has been successed!',
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 14.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20.sp)),
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Badminton - Court',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w800,
                        color: tertiaryColor),
                  ),
                  Text(
                    'Your booking #1684635 has been successed!',
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
