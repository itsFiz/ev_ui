import 'dart:io';
import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/screens/homepage.dart';
import 'package:ev_ui/screens/notif.dart';
import 'package:ev_ui/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class History extends StatefulWidget {
  final void Function() openDrawer;

  const History({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: body(),
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
        title: Text('Booking History'),
      );
  Container body() => Container(
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
        height: 100.h,
        width: 100.w,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          width: 70.w,
          height: 10.h,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(2.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Badminton',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: tertiaryColor),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.sp, horizontal: 15.sp),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Text(
                        'CANCEL',
                        style: TextStyle(fontSize: 10.sp, color: Colors.red),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F6F6),
        ),
      );
}
