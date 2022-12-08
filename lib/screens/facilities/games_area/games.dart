import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/template/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ev_ui/template/category_widget.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: templateAppBar(barName: 'Games Area'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            categoryButton(
                typeImage: 'assets/images/soccertable.jpg',
                typeFacility: 'Soccer Table',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Games()));
                }),
            SizedBox(height: 7.h),
            categoryButton(
                typeImage: 'assets/images/pooltable.jpg',
                typeFacility: 'Pool',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Games()));
                }),
          ],
        ),
      ),
    );
  }
}
