import 'package:beam_tv_1/Model/billing_data_model/billing_data_model.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/my_billing_date.dart';
import 'package:beam_tv_1/resources/components/water_billing_date.dart';
import 'package:beam_tv_1/resources/components/water_history_tile2.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/view/water_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color.dart';
import '../resources/components/header_widget.dart';
import '../resources/image.dart';

class WaterBillingScreen extends StatelessWidget {
  WaterBillingScreen({super.key, required this.waterBillingList});
  final BillingDataModel waterBillingList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerWidget(context, 8, "Water Billing", false, true),
            Container(
              margin: EdgeInsets.only(left: 11.h, right: 11.h),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: blueDarkGradient),
                  borderRadius: BorderRadius.circular(20)),
              height: 200.h,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Image.asset(water, height: 155.h)]),
                  ),
                  //  SizedBox(width: ,)
                  Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(
                          text: 'Name : ',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          children: <InlineSpan>[
                            TextSpan(
                              text: LocalData.name,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(131, 218, 220, 222)),
                            )
                          ])),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text.rich(TextSpan(
                          text: 'Address : ',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          children: <InlineSpan>[
                            TextSpan(
                              text: LocalData.address,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(131, 218, 220, 222)),
                            )
                          ])),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text.rich(TextSpan(
                          text: 'Billing Months : ',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          children: <InlineSpan>[
                            TextSpan(
                              text: waterBillingList
                                  .data!.lastWaterBill!.data!.first.unPaidMonth
                                  .toString(),
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
            ),
            // SizedBox(
            //                           height: availableHeight * 0.5,
            //                           child: MyBillingHistory(
            //                               // history: billingListData
            //                                   .data?.maintenanceHistory),
            //                         ),
            // headerWidget(
            //    context, 8, "Water History", false, false),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: WaterBillingDate(
                paid: waterBillingList!.data!.lastWaterBill!.data!.first!.status
                            .toString() ==
                        "UnPaid"
                    ? false
                    : true,
                waterBillData: waterBillingList.data!.lastWaterBill!,
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 12.h, right: 12.h),
              // color: greyLightBg,
              decoration: BoxDecoration(
                  color: greyLightBg,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15.h, top: 15, bottom: 5),
                      child: Content(
                        data: "Water History",
                        size: 20,
                        weight: FontWeight.bold,
                      )),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          waterBillingList.data!.waterBillingHistory!.length,
                      itemBuilder: (context, index) {
                        final iteration =
                            waterBillingList.data!.waterBillingHistory![index];
                        return WaterHistoryTile(iteration: iteration);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
