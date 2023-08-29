import 'package:beam_tv_1/Model/billing_data_model/water_billing_history.dart';
import 'package:beam_tv_1/resources/app_url.dart';
import 'package:beam_tv_1/resources/components/tanker_detail_field.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterDetail extends StatelessWidget {
  WaterDetail({super.key, required this.value});
  final WaterBillingHistory value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            headerWidget(context, 8, "Water Details", false, true),
            // tankerDetailField("title", "content", 3)
            // TankerDetailScreen(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: primaryLightShade1,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      children: [
                        Image.asset(
                          water,
                          height: 140.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            tankerDetailField(
                                "Meter No", value.meterNumber.toString(), 1),
                            SizedBox(
                              width: 8.w,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField(
                                "Bill Amount", value.amount.toString(), 1),
                            SizedBox(
                              width: 8.w,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("Month", "March", 1),
                            SizedBox(
                              width: 8.w,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("PayDate", "??", 1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField(
                                "Units",
                                "${int.parse(value.currentReading.toString()) - int.parse(value.previousReading.toString())}",
                                1),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     tankerDetailField("Per Unit", "??", 1),

                        //     //  tankerDetailField("Expected Delivery At",
                        //     //       "bjhbhvh", 1),
                        //   ],
                        // ),
                        Container(
                          height: size.height * 0.22,

                          padding: EdgeInsets.only(
                              top: 12, bottom: 12, left: 12, right: 12),
                          margin: EdgeInsets.only(left: 9, right: 9, top: 25),
                          decoration: BoxDecoration(
                              color: greyLightBg,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          // color: AppColors.greyLightBg,
                          child: DottedBorder(
                            color: greyTextLight,
                            strokeWidth: 3,
                            dashPattern: [6, 3],
                            // padding: EdgeInsets.only(top: 35, bottom: 35),
                            // Padding: EdgeInsets.only(top: 15, bottom: 15),
                            borderType: BorderType.RRect,
                            radius: Radius.circular(15),
                            // padding: EdgeInsets.only(bottom: 25),
                            child: Center(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              value.image.toString()))),
                                  // child: Image.asset(
                                  //   guard,
                                  //   height: 155,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
