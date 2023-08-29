import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/view/contact_us_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';
import '../image.dart';
import 'content.dart';

Widget settingTile(icon, String title) {
  return Container(
    margin: EdgeInsets.only(bottom: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.w),
              padding: EdgeInsets.all(13.h),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16.r)),
              child: Image.asset(
                icon,
                height: 24.h,
                color: Colors.white,
              ),
            ),
            Content(
              data: title,
              size: 18.sp,
              weight: FontWeight.bold,
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(right: 16.w),
            child: Image.asset(
              arrowForward,
              width: 26.h,
            )),
      ],
    ),
  );
}
