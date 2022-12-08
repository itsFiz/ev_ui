import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/template/category_widget.dart';
import 'package:ev_ui/template/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Courts extends StatefulWidget {
  const Courts({Key? key}) : super(key: key);

  @override
  State<Courts> createState() => _CourtsState();
}

class _CourtsState extends State<Courts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: templateAppBar(barName: 'Courts'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            categoryButton(
                typeImage: 'assets/images/badminton.jpg',
                typeFacility: 'Badminton',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Courts()));
                }),
            SizedBox(height: 8.h),
            categoryButton(
                typeImage: 'assets/images/basketball.jpg',
                typeFacility: 'Basketball',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Courts()));
                }),
          ],
        ),
      ),
    );
  }
}
