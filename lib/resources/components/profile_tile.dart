import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget profileTile(String icon, String title, String subTitle) {
  return Container(
    padding: EdgeInsets.all(5.h),
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
        color: greyLightBg, borderRadius: BorderRadius.circular(20.r)),
    child: ListTile(
      leading: Image.asset(
        icon,
        color: orange,
        height: 26.h,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Content(data: "$title:", size: 18.sp, weight: FontWeight.bold),
          Content(
            data: subTitle,
            size: 18.sp,
            weight: FontWeight.w500,
            color: greyTextLight,
          ),
        ],
      ),
    ),
  );
}
