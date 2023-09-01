import 'package:beam_tv_1/resources/components/add_contact_tile.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/content_field.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/view/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void addContactAlert(BuildContext context) {
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
      return SafeArea(
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  // padding: EdgeInsets.all(18.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.white),
                  // color: Colors.white,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Content(
                            data: "Add Contact",
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          Divider(
                            height: 1.h,
                            color: Colors.black,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                      AddContactTile(hint: "Name"),
                      SizedBox(
                        height: 8.h,
                      ),
                      AddContactTile(hint: "Contact"),
                      Container(
                        padding:
                            EdgeInsets.only(top: 30.h, left: 35.h, right: 35.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CancelButton(
                              title: "Cancel",
                              func: () {},
                            ),
                            PrimaryButton(
                              title: "Add",
                              func: () {},
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// TextField(
//                       decoration: InputDecoration(
//                         fillColor: greyLightBg,
//                         filled: false,
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide(color: greyTextLight)),
//                         hintText: "Name",
//                       ),
//                     ),
