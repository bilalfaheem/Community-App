import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/Function/Navigation/navigatePop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget headerWidget(
    context, double bottomMargin, String title, bool notification, bool back) {
  return Container(
    margin:
        EdgeInsets.only(top: 6, bottom: bottomMargin, left: 10.w, right: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: back
              ? () {
                  navigatePop(context);
                }
              : null,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
            decoration: BoxDecoration(
              color: back ? greyLightBg : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              backIos,
              height: 24.sp,
              color: back ? Colors.black : Colors.transparent,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
          decoration: BoxDecoration(
              color: notification ? greyLightBg : null,
              borderRadius: BorderRadius.circular(12)),
          child: Image.asset(
            bellActive,
            height: 24.sp,
            color: notification ? null : Colors.transparent,
          ),
        )
      ],
    ),
  );
}

Widget headerTransparentWidget(
    context, double bottomMargin, String title, bool notification) {
  return Container(
    margin: EdgeInsets.only(top: 6, bottom: bottomMargin),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            navigatePop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
            decoration: BoxDecoration(
              color: Color.fromARGB(69, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              backIos,
              height: 24.sp,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
          decoration: BoxDecoration(
              color: notification ? greyLightBg : null,
              borderRadius: BorderRadius.circular(12)),
          child: Image.asset(
            bellActive,
            height: 24.sp,
            color: notification ? null : Colors.transparent,
          ),
        )
      ],
    ),
  );
}
