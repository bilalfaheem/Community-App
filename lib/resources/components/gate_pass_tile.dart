import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/view/pass_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GatePassTile extends StatelessWidget {
  final bool active;
  final String title;
  const GatePassTile({super.key, required this.active, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: active
          ? () {
              // navigate(context, PassDetailScreen(data: "",));
            }
          : null,
      child: Container(
        // height: 40,
        // width: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
        child: ListTile(
          dense: true,
          leading: Container(
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: greyTileColor,
            ),
            child: Image.asset(
              qr,
              color: primaryColor,
              height: 27.h,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          subtitle: Text(
            "Expiry: Jan/30, Mon | 7:15 pm",
            style: TextStyle(
                color: greyTextLight,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp),
          ),
          trailing: active
              ? Image.asset(
                  arrowForward,
                  height: 24.h,
                  color: Colors.black,
                )
              : null,
        ),
      ),
    );
  }
}
