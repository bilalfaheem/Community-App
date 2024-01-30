import 'package:CommunityApp/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button2 extends StatelessWidget {
  const Button2({super.key, this.loading = false, required this.onPress});
  final bool loading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 44.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          onPressed: loading ? () {} : onPress,
          //  () {
          //   forwardAnimationFunc();
          // },
          child: loading
              ? Container(
                  // margin: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      height: 30.h,
                      width: 30.h,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      )))
              : Text("NEXT",
                  style: TextStyle(
                      fontFamily: "Rhizome",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white))),
    );
  }
}
