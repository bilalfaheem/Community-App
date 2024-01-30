import 'package:CommunityApp/resources/components/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeboardTile extends StatelessWidget {
  final String title;
  final String content;
  final Color textColor;
  final String date;
  final String vector;
  const NoticeboardTile(
      {super.key,
      required this.title,
      required this.content,
      required this.date,
      required this.vector,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            // boxShadow: [BoxShadow(
            //   color: Colors.grey.withOpacity(0.5),  // shadow color
            // spreadRadius: 5,                      // spread radius
            // // blurRadius: 7,                        // blur radius
            // // offset: Offset(0, 3),
            // )]
            ),
        margin: EdgeInsets.fromLTRB(20.h, 15.h, 20.h, 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Content(
              data: title,
              size: 20.sp,
              color: textColor,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: 15.h,
            ),
            Content(
              data: content,
              size: 17.sp,
              color: textColor,
              weight: FontWeight.w500,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Content(
                  data: date,
                  size: 14.sp,
                  color: textColor,
                  weight: FontWeight.w500,
                ),
                Image.asset(
                  vector,
                  height: 100.h,
                )
              ],
            )
          ],
        ));
  }
}
