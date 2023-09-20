import 'dart:ui';

import 'package:beam_tv_1/ViewModel/generate_pass_view_model.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Model/gate_pass_data_model/visitor_list.dart';
import '../color.dart';

void visitorTypeAlert(BuildContext context, VisitorList visitorList) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
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
      GeneratePassViewModel generatePassViewModel =
          Provider.of<GeneratePassViewModel>(context, listen: false);
      return Stack(
        children:[ 
          BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
          Center(
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
                    child: Consumer<GeneratePassViewModel>(
                        builder: (context, value, child) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: visitorList.visitorData!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final iteration = visitorList.visitorData![index];
                            return GestureDetector(
                              onTap: () {
                                value.setSelectedVisitorIndex(index);
                              },
                              child: ListTile(
                                // selected: true,
      
                                title: Center(
                                    child: Text(
                                  iteration.name.toString(),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: value.selectedVisitorIndex == index
                                        ? primaryColor
                                        : Colors.black.withOpacity(0.4),
                                  ),
                                )),
                              ),
                            );
                          });
                    }),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CancelButton(
                            title: "Cancel",
                            func: () {
                              Navigator.pop(context);
                            }),
                        PrimaryButton(
                          title: "OK",
                          func: () {
                            if (generatePassViewModel.selectedVisitorIndex ==
                                -1) {
                              Utils.snackBar("select Visitor Type", context);
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 10.h,)
                ],
              )),
        ),
        ]
      );
    },
  );
}
