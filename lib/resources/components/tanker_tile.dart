import 'package:beam_tv_1/Model/tanker_data_model/history_datum.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:beam_tv_1/view/tanker_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TankerTile extends StatelessWidget {
  const TankerTile({super.key, required this.value});
  final HistoryDatum value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigate(context, TankerDetailScreen(value: value));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 17.w),
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
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                      text: 'Order ID : ',
                      style: TextStyle(fontSize: 16.sp),
                      children: <InlineSpan>[
                        TextSpan(
                          text: value.id.toString(),
                          style:
                              TextStyle(fontSize: 16.sp, color: greyTextLight),
                        )
                      ])),
                  Text.rich(TextSpan(
                      text: 'Tanker : ',
                      style: TextStyle(fontSize: 16.sp),
                      children: <InlineSpan>[
                        TextSpan(
                          text: Utils.getInitial(value.type.toString()),
                          style:
                              TextStyle(fontSize: 16.sp, color: greyTextLight),
                        )
                      ]))
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: 'Time : ',
                          style: TextStyle(fontSize: 16.sp),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '2:43 PM',
                              style: TextStyle(
                                  fontSize: 16.sp, color: greyTextLight),
                            )
                          ])),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                        decoration: BoxDecoration(
                            color: greyLightBg,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Text(
                          Utils.getOrderStatus(
                              value.isCompleted.toString(),
                              value.isCanceled.toString(),
                              value.isFailed.toString()),
                          // "Delivered",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      )
                    ],
                  ),
                  Text.rich(TextSpan(
                      text: 'Date : ',
                      style: TextStyle(fontSize: 16.sp),
                      children: <InlineSpan>[
                        TextSpan(
                          text: Utils.dateFormat1(value.createdAt.toString()),
                          style:
                              TextStyle(fontSize: 16.sp, color: greyTextLight),
                        )
                      ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
