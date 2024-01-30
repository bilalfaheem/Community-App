import 'package:CommunityApp/resources/components/content.dart';
import 'package:CommunityApp/resources/components/header_widget.dart';
import 'package:CommunityApp/resources/components/pass_tile.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/resources/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';

import '../resources/color.dart';
import '../resources/utils.dart';

GlobalKey _globalMyPassKey = GlobalKey();

class MyPassScreen extends StatelessWidget {
  MyPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: orange,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 6, bottom: 15.h, left: 10.w, right: 10.w),
                child: headerTransparentWidget(context, 8, "", false),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        RepaintBoundary(
                          key: _globalMyPassKey,
                          child: Stack(
                            children: [
                              Container(
                                color: orange,
                                // height: 800.h,
                                width: 1.sw,
                                child: Column(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.hardEdge,
                                      children: [
                                        Image.asset(
                                          mypass,
                                          height: 700.h,
                                          width: 390.w,
                                        ),
                                        Positioned(
                                            width: 395.w,
                                            top: 85.h,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                PrettyQr(
                                                  size: 130.h,
                                                  data: LocalData.qr
                                                      // data: data.pass!.userRelation!.qrCode
                                                      .toString(),
                                                  roundEdges: true,
                                                )
                                              ],
                                            )),
                                        Positioned(
                                            top: 280.h,
                                            width: 395.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // height: 200,
                                                  width: 395.w,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 60.h),
                                                        child: Content(
                                                          data: "RESIDENT PASS",
                                                          size: 20.h,
                                                          weight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),

                                                      Row(
                                                        children: [
                                                          passTile(
                                                              "Name:",
                                                              LocalData.name,
                                                              18),
                                                        ],
                                                      ),
                                                      15.verticalSpace,
                                                      Row(
                                                        children: [
                                                          passTile(
                                                              "Address:",
                                                              LocalData.address,
                                                              20),
                                                        ],
                                                      ),

                                                      //
                                                      // passTile("Event:", "Dinner"),
                                                      // passTile("Address:", "Z-204"),
                                                      // passTile("Expiry:", "Jan 30, Mon | 7:32pm"),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 40.w,
                          top: 50.h,
                          child: GestureDetector(
                            onTap: () async {
                              var c = await Utils()
                                  .captureWidgetToUnit8list(_globalMyPassKey);
                              print(c);
                              var imgFile = await Utils().uint8ListToXFile(c);
                              Share.shareXFiles([imgFile]);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.65),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.share,
                                color: orange,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
