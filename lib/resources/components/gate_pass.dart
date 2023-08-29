import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/view/generate_gate_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GatePass extends StatelessWidget {
  const GatePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        headerWidget(context, 8, "Gate Pass", false, false),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 72.h,
            ),
            Image.asset(
              qrVector,
              height: 193.h,
            ),
            Container(
              margin: EdgeInsets.only(right: 16.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 3.h),
                    padding: EdgeInsets.all(7.h),
                    decoration: BoxDecoration(
                        color: greyLightBg,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image.asset(
                      qr2,
                      height: 24.h,
                    ),
                  ),
                  Text(
                    "My QR",
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, GenerateGatePassScreen());
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 3.h),
                          padding: EdgeInsets.all(7.h),
                          decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Image.asset(
                            ticket,
                            height: 24.h,
                          ),
                        ),
                        Text(
                          "Generate\nPass",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
