import 'package:beam_tv_1/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget tankerDetailField(String title, String content, int flex) {
  return Expanded(
    flex: flex,
    child: Container(
        margin: EdgeInsets.only(top: 15.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: Colors.white),
        child: Text.rich(TextSpan(
            text: "$title:  ",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: "$content",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                      color: greyTextLight))
            ]))),
  );
}
