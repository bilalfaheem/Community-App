import 'package:CommunityApp/Function/Navigation/navigate.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/complaint_tile.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/components/header_widget.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          headerWidget(context, 8, "Complaint Chat", false, true),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      navigate(context,
                          ChatScreen(to_user: "B", title: "Bilal Faheem"));
                    },
                    child: ComplaintTile(
                      Title: "Water Complaint",
                      vector: water,
                      gradient: blueLightGradient,
                    )),
                ComplaintTile(
                  Title: "Electricity Complaint",
                  vector: electricity,
                  gradient: greenGradient,
                ),
                ComplaintTile(
                  Title: "Gas Complaint",
                  vector: gas,
                  gradient: yellowGradient,
                ),
                ComplaintTile(
                  Title: "Security Complaint",
                  vector: guard,
                  gradient: redGradient,
                ),
                ComplaintTile(
                  Title: "Parking Complaint",
                  vector: car,
                  gradient: blueLightGradient,
                ),
                ComplaintTile(
                  Title: "Service Provider",
                  vector: router,
                  gradient: blackGradient,
                ),
                ComplaintTile(
                  Title: "Other",
                  vector: maintenance,
                  gradient: blueDarkGradient,
                ),
                // Container(
                //   //height: 140.h,
                //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(25.r),
                //       gradient: LinearGradient(
                //           colors: blueLightGradient,
                //           begin: Alignment.centerRight,
                //           end: Alignment.centerLeft)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Content(
                //           data: "Water Complaint",
                //           size: 20.sp,
                //           color: Colors.white,
                //           weight: FontWeight.bold),
                //       Image.asset(
                //         water,
                //         height: 150.h,
                //         fit: BoxFit.cover,
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
