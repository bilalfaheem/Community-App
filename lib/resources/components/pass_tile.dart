import 'package:CommunityApp/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget passTile(String title, String content, int fontSize) {
  return Expanded(
    flex: 2,
    child: Container(
        // width: 300.w,
        margin: EdgeInsets.only(top: 10.h, left: 44.w, right: 44.w),
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: Colors.white),
        child: Center(
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                content,
                style: TextStyle(
                    fontSize: fontSize.sp,
                    fontWeight: FontWeight.bold,
                    color: greyTextLight),
              )
            ],
          ),
        )
        //  Text.rich(TextSpan(
        //     text: "$title:  ",
        //     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        //     children: [
        //       TextSpan(
        //           text: "$content",
        //           style: TextStyle(
        //               fontSize: 18.sp,
        //               fontWeight: FontWeight.w300,
        //               color: greyTextLight))

        ),
  );
}
