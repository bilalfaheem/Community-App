import 'package:beam_tv_1/resources/components/gate_pass_tile.dart';
import 'package:beam_tv_1/resources/components/pass_tile.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class PassScreen extends StatelessWidget {
  const PassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Image.asset(
                pass,
                height: 700.h,
                width: 390.w,
              ),
              Positioned(
                  width: 395.w,
                  top: 125.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrettyQr(
                        size: 130.h,
                        data: "data,",
                        roundEdges: true,
                      )
                    ],
                  )),
              Positioned(
                  top: 320.h,
                  width: 395.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // height: 200,
                        width: 395.w,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                passTile("Name:", "Bilal Faheem", 18),
                              ],
                            ),
                            Row(
                              children: [
                                passTile("Pass Type:", "One Time", 18),
                              ],
                            ),
                            Row(
                              children: [passTile("Event", "Dinner", 18)],
                            ),
                            Row(
                              children: [passTile("Address", "Z-204", 18)],
                            ),
                            Row(
                              children: [
                                passTile("Expiry:", "Jan 30, Mon | 7:32pm", 16)
                              ],
                            )
                            //
                            // passTile("Event:", "Dinner"),
                            // passTile("Address:", "Z-204"),
                            // passTile("Expiry:", "Jan 30, Mon | 7:32pm"),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
