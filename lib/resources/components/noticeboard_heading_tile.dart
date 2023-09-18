import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeboardHeadingTile extends StatelessWidget {
  const NoticeboardHeadingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: orangeDull, borderRadius: BorderRadius.circular(20.r)),
        child: Stack(
          clipBehavior: Clip.none,
          // fit: ,
          children: [
            Row(
              children: [
                Container(
                  height: 80.h,
                  margin: EdgeInsets.only(left: 20.h, top: 10.h, bottom: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Content(
                      //   data: "Today",
                      //   size: 15.sp,
                      //   color: Colors.white,
                      //   weight: FontWeight.w600,
                      // ),
                      Content(
                        data: "Announcements",
                        size: 22.sp,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 30.h,
              bottom: 1,
              child: Image.asset(
                announcement,
                // width: 180.w,
                height: 110.h,
              ),
            )
          ],
        )
        //  Content(data: "Today", size: 13.sp,color:Colors.white),
        );
  }
}
