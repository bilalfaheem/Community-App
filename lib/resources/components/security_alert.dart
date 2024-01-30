import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void securityAlert(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 450),
    transitionBuilder: (_, anim, __, child) {
      final tween = Tween(begin: Offset(0, 1), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInQuad));
      // Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      // }

      return SlideTransition(
        position: tween.animate(anim),
        child:
            //  SliverFadeTransition(
            //   opacity: anim,
            //   sliver: child,
            // )
            FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    "Send Message",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: blueLightGradient),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              admin,
                              height: 92.h,
                            ),
                            Material(
                                color: Colors.transparent,
                                child: Container(
                                    margin: EdgeInsets.only(top: 14.h),
                                    child: Text(
                                      "Admin",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: orangeGradient),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              guard,
                              height: 92.h,
                            ),
                            Material(
                                color: Colors.transparent,
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 14.h),
                                    child: Text(
                                      "Security",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    "Security Alert",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 90.h,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: orangeLight,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              fire,
                              // height: 74.h,
                            ),
                            Expanded(
                              child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10.w),
                                      child: Text(
                                        "Fire\nAlert",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ))),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 90.h,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: orangeLight,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: Text(
                                        "Threat",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ))),
                            ),
                            Image.asset(
                              threat,
                              //  width: 88.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 90.h,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: orangeLight,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              gas,
                              // height: 74.h,
                            ),
                            Expanded(
                              child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10.w),
                                      child: Text(
                                        "Gas\nLeakage",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ))),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 90.h,
                      ),
                    )
                  ],
                )
              ]),
        ),
      );
    },
  );
}
