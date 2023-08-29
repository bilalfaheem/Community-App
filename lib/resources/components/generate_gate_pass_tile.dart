import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget generateGatePassTile(String title, String subTitle) {
  return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(TextSpan(
              text: '$title : ',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              children: <InlineSpan>[
                TextSpan(
                  text: '$subTitle',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: greyTextLight,
                  ),
                )
              ])),
          Image.asset(
            arrowForward,
            width: 24.w,
          )
        ],
      ));
}
