import 'package:CommunityApp/Model/billing_data_model/maintenance_history.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/billing_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBillingHistory extends StatelessWidget {
  const MyBillingHistory({super.key, required this.history});
  final MaintenanceHistory history;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: greyLightBg,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "  Billing History",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 13.h,
            ),
            Expanded(
              child: Container(
                // height: 3,
                child: ListView.builder(
                    itemCount: history.maintenanceHistoryData!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final iteration = history.maintenanceHistoryData![index];
                      return BillingTile(value: iteration);
                    }),
              ),
            )
          ],
        ));
  }
}
