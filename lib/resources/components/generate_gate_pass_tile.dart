import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget generateGatePassTile(String title, String subTitle, bool selected) {
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
                    color: selected ? Colors.black : greyTextLight,
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
