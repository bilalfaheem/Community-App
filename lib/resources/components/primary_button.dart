import 'package:beam_tv_1/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({required this.title, this.loading = false, this.func});
  final String title;
  VoidCallback? func;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r))),
          onPressed:loading?(){}:func,
          child: Container(
            width: 75.w,
            height: 44.h,
            // padding: EdgeInsets.symmetric(
            //     // horizontal: 20.w,
            //     vertical: 17.h),
            child: loading
                ? Container(
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 30.h,
                          width: 30.h,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          )),
                    ],
                  ))
                : Center(
                    child: Text(title,
                        style: TextStyle(
                            fontFamily: "Rhizome",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
          )),
    );
  }
}
