import 'package:ev_ui/dao/userDAO.dart';
import 'package:ev_ui/models/user.dart';
import 'package:ev_ui/screens/history.dart';
import 'package:ev_ui/screens/registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/screens/homepage.dart';
import 'package:ev_ui/screens/notif.dart';
import 'package:ev_ui/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'setting.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final PageController _pageController = PageController();

  void openDrawer() {
    _key.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    UserDAO? userDao = Provider.of<UserDAO>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePage(
            openDrawer: openDrawer,
          ),
          History(
            openDrawer: openDrawer,
          ),
          Setting(
            openDrawer: openDrawer,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff041C29),
        child: Column(
          children: [
            Container(
              height: 30.h,
              width: 70.w,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                        color: primaryColor.withAlpha(150),
                        shape: BoxShape.circle),
                    child: Container(
                      padding: EdgeInsets.all(2.sp),
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
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
                    style: TextStyle(
                        color: tertiaryColor, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    userDao.user!.email!,
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 9.w),
              child: Divider(
                height: 20,
                thickness: 1,
                color: primaryColor.withAlpha(150),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...drawerItems.map((item) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 4.h),
                      child: drawerTile(
                          iconData: item['icon'],
                          label: item['label'],
                          onTap: () {
                            Navigator.pop(context);
                            int index = item['index'];

                            if (index == 3) {
                              userDao.logout();

                              // TODO
                              // logout logic
                            } else if (index == 4) {
                              exit(0);
                            }

                            _pageController.jumpToPage(item['index']);
                          }),
                    );
                  }).toList()
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  List drawerItems = [
    {
      'icon': Ionicons.home_outline,
      'label': 'Home',
      'index': 0,
    },
    {
      'icon': Ionicons.time_outline,
      'label': 'Booking History',
      'index': 1,
    },
    {
      'icon': Ionicons.cog_outline,
      'label': 'Settings',
      'index': 2,
    },
    {
      'icon': Ionicons.log_out_outline,
      'label': 'Logout',
      'index': 3,
    },
    {
      'icon': Ionicons.power_outline,
      'label': 'Exit',
      'index': 4,
    },
  ];

  ListTile drawerTile({
    required IconData iconData,
    required String label,
    required Function()? onTap,
  }) =>
      ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.sp),
            color: primaryColor,
          ),
          child: Icon(
            iconData,
            color: tertiaryColor,
          ),
        ),
        title: Text(
          label,
          style: TextStyle(
            color: tertiaryColor,
          ),
        ),
      );
}
