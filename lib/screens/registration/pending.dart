import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/dao/userDAO.dart';
import 'package:ev_ui/screens/navigation.dart';
import 'package:ev_ui/screens/registration/sign_in.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Pending extends StatefulWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'EV',
              style: TextStyle(
                  color: tertiaryColor,
                  fontSize: 40.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.w),
              child: LottieBuilder.network(
                  'https://assets8.lottiefiles.com/packages/lf20_rRHO95QOkl.json'),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'We\'re evaluating your profile',
              style: TextStyle(
                  color: tertiaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 0.8.h),
            Text(
              '(Please allow for up to 5 minutes for \n our staff to verify your id)',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: tertiaryColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4.h),
            Container(
              decoration: BoxDecoration(
                  color: secondaryColor.withAlpha(150),
                  borderRadius: BorderRadius.circular(5.sp)),
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              child: GestureDetector(
                onTap: () {
                  UserDAO userDAO =
                      Provider.of<UserDAO>(context, listen: false);
                  userDAO.logout();
                },
                child: Text(
                  'Back to Login',
                  style: TextStyle(color: tertiaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
