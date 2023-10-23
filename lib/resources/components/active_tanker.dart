import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/blue_icon_widget.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/view/tanker_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveTanker extends StatelessWidget {
  const ActiveTanker({super.key, required this.value, this.recent = false});
  final value;
  final bool recent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: greyLightBg, borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Active Tanker",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  navigate(
                      context,
                      TankerDetailScreen(
                        value: recent
                            ? value!.activeData!.activeData!.first
                            : value!.activeData!.first,
                        history: false,
                      ));
                  // navigate(context, TankerDetailScreen(value: ));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 9.h),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: blueDarkGradient),
                      borderRadius: BorderRadius.circular(20)),
                  height: 180.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Image.asset(tankerYellow, height: 159.h)]),
                      //  SizedBox(width: ,)
                      Column(
                        // mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              iconWidget(tanker2),
                              Content(
                                data: '   Name : ',
                                size: 15.sp,
                                weight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 85.w,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Content(
                                        data: LocalData.name.toString(),
                                        size: 15.sp,
                                        maxLines: 2,
                                        weight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(131, 215, 220, 222),
                                        alignment: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(children: [
                            iconWidget(calender),
                            Text.rich(TextSpan(
                                text: '   Address : ',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: recent
                                        ? value
                                            ?.activeData
                                            ?.activeData!
                                            .first
                                            .toUserRelation
                                            ?.addressRelation
                                            ?.address
                                            .toString()
                                        :
                                        // "fd",
                                        value?.activeData?.first.toUserRelation
                                            ?.addressRelation?.address
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(131, 215, 220, 222)),
                                  )
                                ])),
                          ]),
                          // SizedBox(
                          //   height:10.h ,
                          // ),
                          // Text.rich(
                          // TextSpan(
                          //   text: 'Billing Months : ',
                          //   style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.white),
                          //   children: <InlineSpan>[
                          //     TextSpan(
                          //       text: 'Mar',
                          //       style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color: Color.fromARGB(131, 215, 220, 222)),
                          //     )
                          //   ]
                          // )
                          // )
                        ],
                      ),
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: 3,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
