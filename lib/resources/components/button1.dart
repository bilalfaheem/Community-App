import 'package:beam_tv_1/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button1 extends StatelessWidget {
  const Button1({super.key, this.loading = false, required this.onPress});
  final bool loading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 295.w,
          height: 44.h,
          // padding: EdgeInsets.symmetric(vertical: 8.h),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: orange,
                  // shadowColor: Colors.transparent,
                  // onPrimary: itemGradient1Light,
                  // animationDuration: defaultAnimationDelay,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: loading ? () {} : onPress,
              //  () {
              //    navigate(context, NavBarScreen());
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
                  : Text("LOGIN",
                      style: TextStyle(
                          fontFamily: "Rhizome",
                          fontSize: 15.h,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))),
        ),
      ],
    );
  }
}
