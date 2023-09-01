import 'package:beam_tv_1/resources/components/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSuccessfullScreen extends StatelessWidget {
  String msg;
   SignupSuccessfullScreen({super.key,required this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Content(data: msg, size: 20.sp),
      ),
    );
  }
}