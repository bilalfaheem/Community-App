import 'package:CommunityApp/Model/billing_data_model/billing_data_model.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/content.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils.dart';

class WaterBillingStatus extends StatelessWidget {
  bool paid;
  String text;
  final picture;
  final colorr;
  BillingDataModel billingData;
  WaterBillingStatus(
      {super.key,
      required this.paid,
      required this.text,
      required this.picture,
      required this.colorr,
      required this.billingData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10.h),
          // margin: EdgeInsets.all(20.h),

          decoration: BoxDecoration(
              color: colorr, borderRadius: BorderRadius.circular(20)),
          height: 150.h,
          child: Column(
            children: [
              Content(
                data: text,
                size: 19,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Image.asset(picture, height: 110.h)]),
                  ),
                  //  SizedBox(width: ,)
                  Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text.rich(TextSpan(
                      //     text: 'Name : ',
                      //     style: TextStyle(
                      //         fontSize: 18.sp,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.white),
                      //     children: <InlineSpan>[
                      //       TextSpan(
                      //         text: 'Bilal',
                      //         style: TextStyle(
                      //             fontSize: 18.sp,
                      //             fontWeight: FontWeight.w500,
                      //             color: Color.fromARGB(131, 218, 220, 222)),
                      //       )
                      //     ])),
                      // SizedBox(
                      //   height: 7.h,
                      // ),
                      Text.rich(TextSpan(
                          text: 'Bill : ',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          children: <InlineSpan>[
                            TextSpan(
                              text: paid
                                  ? "PAID"
                                  : billingData!.data!.lastWaterBill!.data!
                                      .first.response!.first.amount
                                      .toString(),
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(131, 218, 220, 222)),
                            )
                          ])),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text.rich(TextSpan(
                          text: paid ? "Pay date" : 'Due date : ',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          children: <InlineSpan>[
                            TextSpan(
                              text: paid
                                  ? Utils.dateFormat1(
                                      "${billingData!.data!.lastWaterBill!.data!.first.payDate}T10:35:46.000000Z")
                                  : Utils.dateFormat1(
                                      "${billingData!.data!.lastWaterBill!.data!.first.dueDate}T10:35:46.000000Z"),
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(131, 218, 220, 222)),
                            )
                          ]))
                    ],
                  ),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 3,
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}
