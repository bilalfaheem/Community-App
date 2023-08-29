import 'dart:ffi';

import 'package:beam_tv_1/ViewModel/tanker_alert_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../color.dart';
import 'content.dart';

// Widget TankerAlertTiles(image, String title, double heightt,){
//   return Container(
//                        padding:EdgeInsets.all(13.h),
//                       // margin: EdgeInsets.symmetric(vertical: 11.h, ),
//                       height: 80.w,
//                       width: 180.w,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: greyLightBg),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(image, height:heightt,),
//                   SizedBox(width: 17.w,),
//                   Content(data: title, size: 16.sp, weight:FontWeight.w500,),
//                 ],
//               ),
//             );
// }
class TankerAlertTile extends StatelessWidget {
  final String title;
  final String image;
  final double imageHeight;
  final int index;
  final bool type;
  TankerAlertTile(
      {super.key,
      required this.image,
      required this.imageHeight,
      required this.title,
      required this.index,
      required this.type});

  @override
  Widget build(BuildContext context) {
    final tankerAlertViewModel =
        Provider.of<TankerAlertViewModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        tankerAlertViewModel.loading
            ? null
            : !type
                ? tankerAlertViewModel.setType(!type, index)
                : tankerAlertViewModel.setTypeIndex(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),

        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.h),
        // margin: EdgeInsets.symmetric(vertical: 11.h, ),
        height: 150.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: type
                ? tankerAlertViewModel.typeIndex == index
                    ? primaryColor
                    : greyLightBg
                : greyLightBg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, height: imageHeight),
            SizedBox(
              height: 17.h,
            ),
            Content(
                data: title,
                size: 16.sp,
                weight: FontWeight.w500,
                color: type
                    ? tankerAlertViewModel.typeIndex == index
                        ? Colors.white
                        : Colors.black
                    : Colors.black),
          ],
        ),
      ),
    );
  }
}
