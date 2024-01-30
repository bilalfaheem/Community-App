import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/billing_data_model/bill.dart';
import '../../Model/billing_data_model/due_date.dart';

class MyBillingDate extends StatelessWidget {
  MyBillingDate(
      {super.key,
      required this.paid,
      required this.billData,
      required this.dueData});
  bool paid;
  Bill? billData;
  DueDate? dueData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 120.h,
            padding: EdgeInsets.symmetric(vertical: 27.h, horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: greyLightBg),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  calender2,
                  width: 66.h,
                ),
                Expanded(
                    child: SizedBox(
                  width: 1,
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paid ? "Pay Date:" : "Due Date:",
                      style: TextStyle(
                          color: greyTextLight,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      // "Paid",
                      paid
                          ? Utils.dateFormat1(
                              "${dueData!.paidDate}T10:35:46.000000Z")
                          : Utils.dateFormat1(
                              "${dueData!.dueDate}T10:35:46.000000Z"),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Expanded(
                    child: SizedBox(
                  width: 1,
                ))
              ],
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Container(
            height: 120.h,
            padding: EdgeInsets.symmetric(vertical: 27.h, horizontal: 10.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: greenGradient),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  money,
                  width: 66.h,
                ),
                Expanded(
                    child: SizedBox(
                  width: 1,
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bill",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      paid
                          ? "Paid"
                          : billData!.duesBillData!.dueAmount.toString(),
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                          // Color.fromARGB(118, 255, 255, 255)
                          ),
                    ),
                  ],
                ),
                Expanded(
                    child: SizedBox(
                  width: 1,
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
