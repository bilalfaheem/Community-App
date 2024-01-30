import 'package:CommunityApp/resources/components/tanker_detail_field.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/resources/components/header_widget.dart';
import 'package:CommunityApp/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TankerDetailScreen extends StatelessWidget {
  TankerDetailScreen({super.key, required this.value, this.history = true});
  final value;
  bool history;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            headerWidget(context, 8, "Order Details", false, true),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 40.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: primaryLightShade1,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      children: [
                        Image.asset(
                          detail,
                          height: 145.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            tankerDetailField("Name",
                                value.toUserRelation!.fullName.toString(), 1),
                            // SizedBox(width: 10.w,),
                            //   Expanded(
                            //     flex: 3,
                            //     child: Container(
                            //                         padding: EdgeInsets.symmetric(vertical:6.h,horizontal: 12.w ),
                            //                         decoration: BoxDecoration(
                            //                           borderRadius: BorderRadius.circular(10.r),
                            //                           color: Colors.white
                            //                         ),
                            //                         child: Text.rich(TextSpan(
                            //                           text: "Name:  ",
                            //                           style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
                            //                           children: [
                            //     TextSpan(
                            //       text: "Bilal",
                            //       style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w300,color: greyTextLight)
                            //     )
                            //                           ]
                            //                         ))
                            //                       ),
                            //   )
                          ],
                        ),
                        Row(
                          children: [
                            // tankerDetailField("Order ID","34224",1),
                            // SizedBox(width: 8.w,),
                            tankerDetailField(
                                "Unit No",
                                value.toUserRelation!.addressRelation.address
                                    .toString(),
                                1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("Order ID",
                                value.toUserRelation!.id.toString(), 1),
                            SizedBox(
                              width: 8.w,
                            ),
                            tankerDetailField(
                                "Status",
                                Utils.getOrderStatus(
                                    value.isCompleted.toString(),
                                    value.isCanceled.toString(),
                                    value.isFailed.toString()),
                                1),
                          ],
                        ),
                        Row(
                          children: [
                            // tankerDetailField("Status","Delivered",1),
                            // SizedBox(width: 8.w,),
                            tankerDetailField("Type", value.type.toString(), 1),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     tankerDetailField("Created Time", value.toUserRelation!.createdAt.toString(), 1),
                        //   ],
                        // ),
                        Row(
                          children: [
                            tankerDetailField("Created At",
                                Utils.dateFormat2(value.createdAt), 1),
                          ],
                        ),
                        Row(
                          children: [
                            history
                                ? tankerDetailField("Delivered At",
                                    Utils.dateFormat2(value.deliveryAt), 1)
                                : tankerDetailField("Expected Delivery At",
                                    Utils.dateFormat2(value.deliveryAt), 1),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
