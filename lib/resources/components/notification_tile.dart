import 'package:CommunityApp/resources/sizeconfig.dart';
import 'package:CommunityApp/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';
import 'content.dart';

class NotificationTile extends StatelessWidget {
  final iteraion;
  // final String leading;
  // final String title;
  // final String subtitle;
  // final String date;

  NotificationTile({super.key, required this.iteraion
      // required this.leading,
      // required this.title,
      // required this.subtitle,
      // required this.date,
      });

  @override
  Widget build(BuildContext context) {
    SizeConfig sized = SizeConfig(context);
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r), color: greyLightBg),
      // margin: EdgeInsets.only(bottom: 5.h),
      child: Stack(
        fit: StackFit.loose,
        children: [
          ListTile(
            dense: true,
            // visualDensity: VisualDensity(),
            contentPadding: EdgeInsets.zero,
            // contentPadding: EdgeInsets.all(8.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.r)),
            tileColor: greyLightBg,
            leading: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                width: 61.h,
              ),
            ),
            title: Content(
              data: iteraion.notificationType,
              size: 18.sp,
              weight: FontWeight.bold,
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 8.h,),
                Content(
                  data: iteraion.message,
                  size: 16.sp,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Content(
                        data: Utils.dateFormat1(iteraion.notificationCreatedAt),
                        size: 12)),
              ],
            ),
          ),
          Positioned(
            top: 1,
            child: Container(
                // alignment: Alignment.topCenter,
                // margin: EdgeInsets.only(bottom: 6, ),
                // clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Image.asset(
                  Utils.getNotificationIcon(iteraion.notificationType),
                  width: 61.h,
                  height: 61.h,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
