import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/view/notification_screen.dart';
import 'package:beam_tv_1/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            logo,
            height: 46.h,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  navigate(context, ProfileScreen());
                },
                child: Container(
                    height: 40.h,
                    width: 40.h,
                    clipBehavior: Clip.hardEdge,
                    padding:
                        LocalData.profile == null ? EdgeInsets.all(5.h) : null,
                    decoration: BoxDecoration(
                      // border: Border.all(color: orange,width: 2),
                      color: primaryLightShade2,

                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: LocalData.profile == null
                        ? Image.asset(profileIcon)
                        : Image.network(LocalData.profile, fit: BoxFit.cover)),
              ),
              GestureDetector(
                onTap: () {
                  navigate(context, NotificationScreen());
                },
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  margin: EdgeInsets.only(left: 5.h),
                  padding: EdgeInsets.all(5.h),
                  decoration: BoxDecoration(
                      color: greyTileColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(notificationOff),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
