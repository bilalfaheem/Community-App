import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget homeCard(vector, label, gradient) {
  return Container(
      height: 100.h,
      width: 190.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
        borderRadius: BorderRadius.circular(20),
        // image: DecorationImage(image:AssetImage(vector),scale: 0.1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //  crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            vector,
            height: 64.h,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '''$label''',
                  textAlign: TextAlign.end,
                  maxLines: 10,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ));
}
