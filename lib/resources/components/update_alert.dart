import 'dart:ui';

import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateAlert extends StatelessWidget {
  const UpdateAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
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
                      "B E A M",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
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
                      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto, placeat nam porro provident quidem sit ratione sequi officiis vel tempore, iusto ex dolores eaque voluptatem corporis, accusamus dolorum? Optio, totam. Exercitationem eius error iure fugit necessitatibus nesciunt excepturi optio corrupti minima ab ",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // CancelButton(
                          //   title: "Cancel",
                          //   func: () {
                          //     Navigator.pop(context);
                          //   },
                          // ),
                          PrimaryButton(
                            title: "Update",
                            // loading: true,
                            func: () {
                              // Loading()
                              // logOut(context, true);
                              // Navigator.push(context, )
                              String url =
                                  "https://play.google.com/store/apps/details?id=com.techlogix.mobilinkcustomer&pcampaignid=web_share";
                              Uri uri = Uri.parse(url);
                              launch(uri.toString());
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
      ),
    );
  }
}
