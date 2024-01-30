import 'package:CommunityApp/Model/billing_data_model/maintenance_history_datum.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillingTile extends StatelessWidget {
  const BillingTile({super.key, required this.value});
  final MaintenanceHistoryDatum? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 109, 107, 107).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(2, 2),
            )
          ],
          borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(
                    text: 'Month : ',
                    style: TextStyle(fontSize: 16.sp),
                    children: <InlineSpan>[
                      TextSpan(
                        text: Utils.getMonth(value?.date),
                        style: TextStyle(fontSize: 16.sp, color: greyTextLight),
                      )
                    ])),
                Text.rich(TextSpan(
                    text: 'Pay Date : ',
                    style: TextStyle(fontSize: 16.sp),
                    children: <InlineSpan>[
                      TextSpan(
                        text: Utils.dateFormat1(value?.createdAt),
                        style: TextStyle(fontSize: 16.sp, color: greyTextLight),
                      )
                    ]))
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(
                    text: 'Mode : ',
                    style: TextStyle(fontSize: 16.sp),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Cash',
                        style: TextStyle(fontSize: 16.sp, color: greyTextLight),
                      )
                    ])),
                Text.rich(TextSpan(
                    text: 'Bill Amount : ',
                    style: TextStyle(fontSize: 16.sp),
                    children: <InlineSpan>[
                      TextSpan(
                        text: value?.amount,
                        style: TextStyle(fontSize: 16.sp, color: greyTextLight),
                      )
                    ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
