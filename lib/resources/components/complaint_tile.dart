import 'package:CommunityApp/resources/components/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplaintTile extends StatelessWidget {
  String Title;
  String vector;
  List<Color> gradient;
  ComplaintTile(
      {super.key,
      required this.Title,
      required this.vector,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 40.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Content(
              data: Title,
              size: 20.sp,
              color: Colors.white,
              weight: FontWeight.bold),
          Image.asset(
            vector,
            height: 75.h,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
