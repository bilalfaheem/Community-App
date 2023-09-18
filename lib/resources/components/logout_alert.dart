import 'dart:ui';

import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:beam_tv_1/resources/components/logout.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cancel_button.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Center(
          child: Material(
            child: Container(
              width: 350.w,
              // margin: EdgeInsets.symmetric(horizontal: 10,),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LOGOUT",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Are You Sure You Want To Logout.?",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CancelButton(
                          title: "Cancel",
                          func: () {
                            Navigator.pop(context);
                          },
                        ),
                        PrimaryButton(
                          title: "OK",
                          // loading: true,
                          func: () {
                            // Loading()
                            logOut(context, true);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
