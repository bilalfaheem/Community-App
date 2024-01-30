import 'package:CommunityApp/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget iconWidget(icon) {
  return Container(
    padding: EdgeInsets.all(6.h),
    decoration: BoxDecoration(
        color: primaryColor, borderRadius: BorderRadius.circular(10)),
    child: Image.asset(
      icon,
      height: 18.h,
      // width: 18.w,
    ),
  );
}
