import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/billing_tile.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/components/tanker_detail_field.dart';
import 'package:beam_tv_1/view/pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class PassDetailScreen extends StatelessWidget {
  const PassDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          headerWidget(context, 8, "Generate Gate Pass", false, true),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            // color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Spacer(),
                  // Expanded(
                  //   flex: 2,
                  //   child: SizedBox(
                  //     height: 2,
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: greyLightBg,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        PrettyQr(
                          size: 150.h,
                          data: "data",
                          roundEdges: true,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            tankerDetailField("Name", "Bilal Faheem", 1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("Pass Type", "One Time", 1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("Event", "Dinner", 1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("Address", "Z-204", 1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("Expiry", "Jan/30, Mon", 1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("Pass Type", "One Time", 1),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CancelButton(
                              title: "Share",
                              func: () {
                                navigate(context, PassScreen());
                              },
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            PrimaryButton(
                              title: "Copy",
                              func: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
