import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/models/user.dart';
import 'package:ev_ui/template/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:ev_ui/dao/userDAO.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    UserDAO? userDao = Provider.of<UserDAO>(context);
    return Scaffold(
      backgroundColor: Color(0xff0D1724),
      appBar: templateAppBar(barName: 'Profile'),
      body: Container(
        color: Color(0xff0D1724),
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.all(2.sp),
              decoration: BoxDecoration(
                  color: primaryColor.withAlpha(150), shape: BoxShape.circle),
              child: Container(
                padding: EdgeInsets.all(2.sp),
                decoration: BoxDecoration(
                    color: Colors.black54, shape: BoxShape.circle),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: CircleAvatar(
                    radius: 30.sp,
                    backgroundImage: AssetImage(
                      'assets/images/loki.jpg',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              userDao.user!.name.toString(),
              style:
                  TextStyle(color: tertiaryColor, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 2.h),
            Text(
              userDao.user!.email!,
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
