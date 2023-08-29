import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelButton extends StatelessWidget {
  final String title;
  VoidCallback? func;
  CancelButton({super.key, required this.title, this.func});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(20.r))),
        onPressed: func,
        child: Container(
          width: 75.w,
          padding: EdgeInsets.symmetric(
              // horizontal: 20.w,
              vertical: 17.h),
          child: Center(
            child: Text(title,
                style: TextStyle(
                    fontFamily: "Rhizome",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ));
  }
}
