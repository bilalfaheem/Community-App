import 'package:beam_tv_1/Model/event.dart';
import 'package:beam_tv_1/Model/gate_pass_data_model/type_list.dart';
import 'package:beam_tv_1/ViewModel/generate_pass_alert_view_model.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/view/generate_gate_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

void passTypeAlert(BuildContext context, TypeList typeList) {
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
      GeneratePassAlertViewModel generatePassAlertViewModel =
          Provider.of<GeneratePassAlertViewModel>(context, listen: false);
      return Center(
        child: Material(
          color: Colors.transparent,
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
                    Container(
                    height: 300.h,
                    width: 300,
                    child: Consumer<GeneratePassAlertViewModel>(
                        builder: (context, value, child) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: typeList.passListData!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final iteration = typeList.passListData![index];
                            return
                                // Content(data: eventMap[index].title.toString(), size: 16.sp);
                                GestureDetector(
                              onTap: () {
                                value.setSelectedPassTypeIndex(index);
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                // selected: true,

                                title: Center(
                                    child: Content(
                                  data: iteration.name.toString(),
                                  size: 16.sp,
                                  weight: FontWeight.w600,
                                  color: value.selectedPassTypeIndex == index
                                      ? primaryColor
                                      : Colors.black.withOpacity(0.4),
                                )),
                              ),
                            );
                          });
                    }),
                  ),
                //  Material(
                //     child: ListView.builder(
                //         padding: EdgeInsets.zero,
                //         itemCount: typeList.passListData!.length,
                //         shrinkWrap: true,
                //         physics: NeverScrollableScrollPhysics(),
                //         itemBuilder: (context, index) {
                //           final iteration =  typeList.passListData![index];
                //           return ListTile(
                //             // selected: true,
                //             title: Center(
                //                 child: Text(
                //               iteration.name.toString(),
                //               style: TextStyle(
                //                   fontSize: 16.sp, fontWeight: FontWeight.w500),
                //             )),
                //           );
                //         }),
                //   ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CancelButton(title: "Cancel", func: () {Navigator.pop(context);}),
                        PrimaryButton(title: "OK", func: () {if (generatePassAlertViewModel.selectedPassTypeIndex ==
                                -1) {
                              Utils.snackBar("select Pass Type", context);
                            } else {
                              Navigator.pop(context);
                            }},)
                      ],
                    ),
                  ),
                  // SizedBox(height: 10.h,)
                ],
              )),
        ),
      );
    },
  );
}
