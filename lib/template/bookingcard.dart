import 'package:ev_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget bookingCard({
  required String facilityPic,
  required String facilitiesName,
  required String facilitiesType,
  required String id,
}) {
  return Card(
    shadowColor: Colors.black87,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(15.sp)),
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
