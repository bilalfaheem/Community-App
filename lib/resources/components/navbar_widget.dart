import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/Provider/navbar_provider.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:beam_tv_1/resources/components/security_alert.dart';

Widget navBar(context) {
  // final homeProvider = Provider.of<HomeProvider>(context, listen: true);
  final navBarProvider = Provider.of<NavbarProvider>(context, listen: false);
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 70.h,
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                    offset: Offset(-1.0, -1.0)),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Consumer<NavbarProvider>(builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 2,
                    )),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      height: 5,
                      width: 37,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInToLinear,
                      // margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color:
                              value.screen == 0 ? orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      // child: Image.asset(
                      //   card,
                      //   height: 29.h,
                      // ),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.changeScreen(0);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        duration: Duration(seconds: 2),
                        child: Image.asset(
                          value.screen == 0 ? home : home2,
                          height: 29.h,
                          color: value.screen == 0 ? orange : null,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                        opacity: value.screen == 0 ? 1 : 0,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: value.screen == 0
                                  ? orange
                                  : Colors.transparent,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 2,
                    )),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      height: 5,
                      width: 37,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastLinearToSlowEaseIn,
                      // margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color:
                              value.screen == 1 ? orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      // child: Image.asset(
                      //   card,
                      //   height: 29.h,
                      // ),
                    ),

                    // yahan ayegi gate [a]
                    GestureDetector(
                      onTap: () {
                        // Utils.snackBar(
                        // "Not Subscribed to Gate Pass Service", context);
                        value.changeScreen(1);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        duration: Duration(seconds: 2),
                        child: Image.asset(
                          qr,
                          height: 29.h,
                          color: value.screen == 1 ? orange : null,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                        opacity: value.screen == 1 ? 1 : 0,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "GatePass",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: value.screen == 1
                                  ? orange
                                  : Colors.transparent,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                ),
                Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: 1,
                    )),
                //  GestureDetector(
                //   onTap: () {
                //     value.changeScreen(2);
                //     // print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$auctionHugagId>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                //   },
                //   child: AnimatedContainer(
                //     margin: EdgeInsets.only(bottom: 40),
                //     duration: Duration(seconds: 1),
                //     curve: Curves.fastLinearToSlowEaseIn,
                //     // margin: EdgeInsets.only(right: 10),
                //     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color:orange ,
                //     ),
                //     child: Image.asset(
                //       add,
                //       color:Colors.white,
                //       height: 22,
                //     ),
                //   ),
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AnimatedContainer(
                      height: 5,
                      width: 37,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInToLinear,
                      // margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color:
                              value.screen == 2 ? orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.r)),
                      // child: Image.asset(
                      //   card,
                      //   height: 29.h,
                      // ),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.changeScreen(2);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        duration: Duration(seconds: 2),
                        child: Image.asset(
                          value.screen == 2 ? tankerOrange : tankerGrey,
                          // value.screen == 0 ? home : home2,
                          height: 29.h,
                          color: value.screen == 2 ? orange : null,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                        opacity: value.screen == 2 ? 1 : 0,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "Tanker",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: value.screen == 2
                                  ? orange
                                  : Colors.transparent,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 2,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AnimatedContainer(
                      height: 5,
                      width: 37,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInToLinear,
                      // margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          color:
                              value.screen == 3 ? orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      // child: Image.asset(
                      //   card,
                      //   height: 29.h,
                      // ),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.changeScreen(3);
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(top: 6.h, bottom: 4.h),
                        duration: Duration(seconds: 2),
                        // duration: Duration(seconds: 1),
                        // curve: Curves.fastLinearToSlowEaseIn,
                        // padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                        // decoration: BoxDecoration(
                        //   shape: BoxShape.circle,
                        // ),
                        child: Image.asset(
                          value.screen == 3 ? cardOrange : card,
                          height: 29.h,
                          color: value.screen == 3 ? orange : null,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                        opacity: value.screen == 3 ? 1 : 0,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "Billing",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: value.screen == 3
                                  ? orange
                                  : Colors.transparent,
                              fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 5.h,
                    )
                  ],
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 1,
                    ))
              ],
            );
          }),
        ),
        Positioned(
          left: 179.w,
          bottom: 35.h,
          child: GestureDetector(
            onTap: () {
              // securityAlert(context);
              Utils.snackBar("Not Subscribed", context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: orange, shape: BoxShape.circle),
              child: Container(
                // height: 70,
                // margin: EdgeInsets.all(10),
                child: Image.asset(
                  add,
                  height: 48.h,
                ),
              ),
            ),
          ),
        ),
      ]),
    ],
  );
}
