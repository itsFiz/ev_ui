import 'dart:io';
import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/screens/facilities/bbq.dart';
import 'package:ev_ui/screens/facilities/courts.dart';
import 'package:ev_ui/screens/facilities/games.dart';
import 'package:ev_ui/screens/facilities/spaces.dart';
import 'package:ev_ui/screens/home.dart';
import 'package:ev_ui/screens/notif.dart';
import 'package:ev_ui/screens/profile.dart';
import 'package:ev_ui/template/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: secondaryColor,
      appBar: appBar(),
      body: body(),
      drawer: Drawer(
        backgroundColor: Color(0xff041C29),
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff00314D),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffC51A1A), width: 1.2),
              ),
              child: TextButton(
                onPressed: () {
                  exit(0);
                },
                child: Text('EXIT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Ionicons.menu_outline),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        title: Text('EV'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Notif()));
              },
              icon: Icon(Ionicons.notifications_outline)),
          GestureDetector(
            child: CircleAvatar(),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      );
  Container body() => Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi',
              style: TextStyle(fontSize: 17.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              'Welcome Back',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 2.h),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search...',
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.sp)),
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(7.sp),
                    ),
                    child: Icon(
                      Ionicons.search_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Facilities',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                // GestureDetector(
                //     child: Text(
                //   'See all',
                //   style: TextStyle(fontSize: 15.sp, color: Color(0xff5E5D5D)),
                // )),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 16.h,
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  facilityButton(
                    iconData: Ionicons.basketball_outline,
                    label: 'Courts',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Courts()));
                    },
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  facilityButton(
                    iconData: Ionicons.school_outline,
                    label: 'Spaces',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Spaces()));
                    },
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  facilityButton(
                    iconData: Ionicons.game_controller_outline,
                    label: 'Games',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Games()));
                    },
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  facilityButton(
                    iconData: Ionicons.restaurant_outline,
                    label: 'BBQ Pits',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Bbq()));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent bookings',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  child: Text(
                    'See all',
                    style: TextStyle(fontSize: 15.sp, color: Color(0xff5E5D5D)),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Notif()));
                  },
                ),
              ],
            ),
            SizedBox(height: 2.h),
            SizedBox(
              height: 10,
              child: ListView(),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xffF6F6F6),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp))),
      );
}
