import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/view/tanker_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestTanker extends StatelessWidget {
  const RequestTanker({super.key, required this.tankerLeft});
  final String tankerLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20.w),
            Expanded(
              child: Container(
                height: 120.h,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: greyLightBg),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      timer,
                      height: 80.h,
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
                          "Tanker Left:",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(9)),
                            child: Center(
                                child: Text(
                              tankerLeft,
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
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
              child: GestureDetector(
                onTap: () {
                  tankerAlert(context);
                },
                child: Container(
                  height: 120.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 27.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: orangeGradient),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        tankerBlue,
                        height: 59.h,
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
                            "Request\nTanker",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          // Text("Tanker",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color: Color.fromARGB(118, 255, 255, 255)),),
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
            ),
            SizedBox(width: 20.w),
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
