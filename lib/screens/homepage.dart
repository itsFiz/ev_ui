import 'dart:developer';
import 'dart:io';
import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/dao/userDAO.dart';
import 'package:ev_ui/models/user.dart';
import 'package:ev_ui/screens/facilities/bbq/bbq.dart';
import 'package:ev_ui/screens/facilities/courts/courts.dart';
import 'package:ev_ui/screens/facilities/games_area/games.dart';
import 'package:ev_ui/screens/facilities/spaces/spaces.dart';
import 'package:ev_ui/screens/home.dart';
import 'package:ev_ui/screens/notif.dart';
import 'package:ev_ui/screens/profile.dart';
import 'package:ev_ui/template/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  final void Function() openDrawer;

  const HomePage({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    UserDAO? userDao = Provider.of<UserDAO>(context);

    return Scaffold(
      key: _key,
      backgroundColor: secondaryColor,
      appBar: appBar(),
      body: body(user: userDao.user),
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
            log('open');
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
            child: Container(
              padding: EdgeInsets.all(1.sp),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: primaryColor),
              child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 12.sp,
                  backgroundImage: AssetImage(
                    'assets/images/loki.jpg',
                  )),
            ),
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
  Container body({User? user}) => Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi, ',
                  style: TextStyle(fontSize: 17.sp),
                ),
                Text(
                  user!.name.toString(),
                  style: TextStyle(fontSize: 17.sp),
                ),
              ],
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
              height: 2.h,
            ),
            SizedBox(
              height: 20.h,
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  facilityButton(
                    iconData: Ionicons.basketball_outline,
                    label: 'Courts',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Courts()));
                    },
                  ),
                  SizedBox(
                    width: 2.w,
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
                    width: 2.w,
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
                    width: 2.w,
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
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  quickBook(
                      facilityPic: 'soccertable.jpg',
                      facilitiesName: 'Soccer Table',
                      facilitiesType: 'Indoor Games Area',
                      id: ''),
                  SizedBox(
                    height: 1.h,
                  ),
                  quickBook(
                      facilityPic: 'badminton.jpg',
                      facilitiesName: 'Badminton',
                      facilitiesType: 'Sport Court',
                      id: ''),
                  quickBook(
                      facilityPic: 'soccertable.jpg',
                      facilitiesName: 'Soccer Table',
                      facilitiesType: 'Indoor Games Area',
                      id: ''),
                ],
              ),
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

Widget quickBook({
  required String facilityPic,
  required String facilitiesName,
  required String facilitiesType,
  required String id,
}) {
  return Card(
    shadowColor: Colors.black45,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(5.sp)),
    elevation: 3,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.sp),
            child: Image.asset(
              'assets/images/$facilityPic',
              height: 6.h,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: SizedBox(
              height: 6.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    facilitiesName,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 12.sp),
                  ),
                  Text(
                    facilitiesType,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.all(7.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.sp)),
            ),
            child: Text(
              'Book Now',
              style: TextStyle(color: tertiaryColor),
            ),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
