import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/resources/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBilling extends StatelessWidget {
  String month;
  MyBilling({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: blueDarkGradient),
              borderRadius: BorderRadius.circular(20)),
          height: 180.h,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(billing, height: 159.h)]),
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
                              overflow: TextOverflow.ellipsis,
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
                          text: month,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              color: Color.fromARGB(131, 218, 220, 222)),
                        )
                      ]))
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
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}
