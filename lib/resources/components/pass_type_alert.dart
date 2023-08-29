import 'package:beam_tv_1/Model/event.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/view/generate_gate_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void passTypeAlert(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 450),
    transitionBuilder: (_, anim, __, child) {
      final tween = Tween(begin: Offset(1, 0), end: Offset.zero)
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
            width: 246.w,
            // margin: EdgeInsets.symmetric(horizontal: 90.w),
            // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 13.h,
                ),
                Material(
                  child: Text(
                    "Pass Type",
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                const Material(
                  child: Divider(
                    height: 1,
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                Material(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: typeList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          // selected: true,
                          title: Center(
                              child: Text(
                            typeList[index],
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          )),
                        );
                      }),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CancelButton(title: "Cancel"),
                      PrimaryButton(title: "OK")
                    ],
                  ),
                ),
                // SizedBox(height: 10.h,)
              ],
            )),
      );
    },
  );
}
