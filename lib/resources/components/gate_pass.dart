import 'package:CommunityApp/Function/Navigation/navigate.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/header_widget.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/view/generate_gate_pass_screen.dart';
import 'package:CommunityApp/view/my_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/gate_pass_data_model/event_list.dart';
import '../../Model/gate_pass_data_model/type_list.dart';
import '../../Model/gate_pass_data_model/validity_list.dart';
import '../../Model/gate_pass_data_model/visitor_list.dart';

class GatePass extends StatelessWidget {
  final EventList eventList;
  final TypeList typeList;
  final VisitorList visitorList;
  final ValidityList validityList;

  GatePass(
      {super.key,
      required this.eventList,
      required this.typeList,
      required this.visitorList,
      required this.validityList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3.sh,
      child: Column(
        children: [
          headerWidget(context, 8, "Gate Pass", false, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 72.h,
              ),
              Image.asset(
                qrVector,
                height: 193.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 16.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigate(context, MyPassScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 3.h),
                            padding: EdgeInsets.all(7.h),
                            decoration: BoxDecoration(
                                color: greyLightBg,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Image.asset(
                              qr2,
                              height: 24.h,
                            ),
                          ),
                          Text(
                            "My QR",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(
                            context,
                            GenerateGatePassScreen(
                              eventList: eventList,
                              typeList: typeList,
                              visitorList: visitorList,
                              validityList: validityList,
                            ));
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 3.h),
                            padding: EdgeInsets.all(7.h),
                            decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Image.asset(
                              ticket,
                              height: 24.h,
                            ),
                          ),
                          Text(
                            "Generate\nPass",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
