import 'package:beam_tv_1/Model/event.dart';
import 'package:beam_tv_1/Model/gate_pass_data_model/event_list.dart';
import 'package:beam_tv_1/ViewModel/generate_pass_alert_view_model.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void eventTypeAlert(BuildContext context, EventList eventList) {
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
      GeneratePassAlertViewModel generatePassAlertViewModel =
          Provider.of<GeneratePassAlertViewModel>(context, listen: false);
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
              width: 260.w,
              // margin: EdgeInsets.symmetric(horizontal: 90.w),
              // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  Text(
                    "Event",
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Container(
                    height: 300.h,
                    width: 300,
                    child: Consumer<GeneratePassAlertViewModel>(
                        builder: (context, value, child) {
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: eventList.eventData!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final iteration = eventList.eventData![index];
                            return
                                // Content(data: eventMap[index].title.toString(), size: 16.sp);
                                GestureDetector(
                              onTap: () {
                                value.setSelectedEventIndex(index);
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                // selected: true,

                                title: Center(
                                    child: Content(
                                  data: iteration.name.toString(),
                                  size: 16.sp,
                                  weight: FontWeight.w600,
                                  color: value.selectedEventIndex == index
                                      ? primaryColor
                                      : Colors.black.withOpacity(0.4),
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
                      //  mainAxisSize: MainAxisSize.min,
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
                          func: () {
                            if (generatePassAlertViewModel.selectedEventIndex ==
                                -1) {
                              Utils.snackBar("select Event", context);
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        ),
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
