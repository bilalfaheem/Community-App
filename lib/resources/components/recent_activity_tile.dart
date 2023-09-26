import 'package:beam_tv_1/Model/recent_activity_data_model/logs_datum.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:beam_tv_1/view/maintenance_billing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view/billing_screen.dart';

class RecentActivityTile extends StatelessWidget {
  final LogsDatum value;
  final bool last;
  const RecentActivityTile(
      {super.key, required this.value, required this.last});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: last ? 100.h : 10.h),
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => BillingScreen()));
          },
          contentPadding: EdgeInsets.zero,
          isThreeLine: false,
          // dense: false,
          visualDensity: VisualDensity(vertical: 3),
          // minLeadingWidth: 80,
          leading: Container(
            width: 70.h,
            height: 70.h,
            padding: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
                color: primaryLightShade2,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding:
                  Utils.getRecentActivityIcon(value.type.toString()) == tanker
                      ? EdgeInsets.zero
                      : EdgeInsets.all(4.h),
              child: Image.asset(
                Utils.getRecentActivityIcon(value.type.toString()),
                width: 5.h,
                height: 5.h,
                // fit:BoxFit.cover,
                color: primaryColor,
              ),
            ),
          ),
          title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 7.w,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          value.type!.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                        // Text(
                        //   " 324242",
                        //   style: TextStyle(color: greyTextLight, fontSize: 15.sp),
                        // ),
                      ],
                    ),

                    //  Expanded(child: SizedBox(width: 3,)),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                      decoration: BoxDecoration(
                          color: greyTextLight,
                          //  greenColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        value.status.toString(),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  child: Text(
                    value.content.toString(),
                    style: TextStyle(
                      color: greyTextLight,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      clock,
                      color: Colors.black,
                      height: 17.h,
                    ),
                    Text(value.time.toString(),
                        style: TextStyle(fontSize: 13.sp))
                  ],
                ),
              ]),
        ));
  }
}

Widget recentTile(context) {
  return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BillingScreen()));
        },
        contentPadding: EdgeInsets.zero,
        isThreeLine: false,
        // dense: false,
        visualDensity: VisualDensity(vertical: 3),
        // minLeadingWidth: 80,
        leading: Container(
          width: 70.sp,
          height: 70.sp,
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
              color: primaryLightShade2,
              borderRadius: BorderRadius.circular(20)),
          child: Image.asset(
            tanker,
            width: 10.w,
          ),
        ),
        title: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: 67.w,
              //   height: 73.h,
              //   padding: EdgeInsets.all(10.h),
              //   decoration: BoxDecoration(
              //     color: Color.fromARGB(52, 7, 73, 114),
              //     borderRadius: BorderRadius.circular(20)
              //   ),
              //   child: Image.asset(tanker,width: 41.w,),
              // ),
              SizedBox(
                width: 7.w,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Order ID:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                      Text(
                        " 324242",
                        style: TextStyle(color: greyTextLight, fontSize: 15.sp),
                      ),
                    ],
                  ),

                  //  Expanded(child: SizedBox(width: 3,)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Active",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 3.h),
                child: Text(
                  "Change the Delivery Date to tanker",
                  style: TextStyle(
                    color: greyTextLight,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    clock,
                    color: Colors.black,
                    height: 17.h,
                  ),
                  Text(" 02:30", style: TextStyle(fontSize: 13.sp))
                ],
              ),
              Container(
                // color: Colors.amber,
                margin: EdgeInsets.only(top: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: SizedBox(
                      width: 1,
                    )),
                    Row(
                      children: [
                        Image.asset(
                          delete,
                          height: 23.h,
                        ),
                        Text(
                          " Delete",
                          style: TextStyle(fontSize: 15.sp),
                        )
                      ],
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 1,
                    )),
                    Container(
                        // margin: EdgeInsets.only(left: 30.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 7.h, horizontal: 15.w),
                        decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              securityOutline,
                              height: 23.h,
                            ),
                            Text(
                              " Gate Pass",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.sp),
                            )
                          ],
                        )),
                  ],
                ),
              )
            ]),
      ));
}
