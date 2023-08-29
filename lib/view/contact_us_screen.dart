import 'package:beam_tv_1/resources/components/contact_us_tile.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color.dart';
import '../resources/components/header_widget.dart';
import '../resources/image.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    // var size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: blueDarkGradient)),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: headerTransparentWidget(
                        context, 8, "Contact Us", false)),
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.r),
                                    topRight: Radius.circular(50.r)),
                                child: Image.asset(patternbg3)),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 22.h, right: 22.h),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 12.5.h),
                                    child: Content(
                                      data: "Terms and conditions",
                                      size: 22.h,
                                      weight: FontWeight.bold,
                                    )),
                                ContactUsTile(
                                    Title:
                                        "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                                ContactUsTile(
                                    Title:
                                        "Terms and Conditions” is the document governing"),
                                ContactUsTile(
                                    Title:
                                        "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                                ContactUsTile(
                                    Title:
                                        "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                                ContactUsTile(
                                    Title:
                                        "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                                ContactUsTile(
                                    Title:
                                        "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                                Container(
                                  margin: EdgeInsets.only(top: 27.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 25.h),
                                          child: Image.asset(
                                            logo,
                                            width: 28.h,
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                color: orange),
                                            width: 40.h,
                                            padding: EdgeInsets.all(8.h),
                                            child: Image.asset(
                                              phone,
                                              color: Colors.white,
                                              width: 19.h,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                color: orange),
                                            width: 40.h,
                                            padding: EdgeInsets.all(8.h),
                                            child: Image.asset(
                                              mail,
                                              color: Colors.white,
                                              width: 19.h,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
