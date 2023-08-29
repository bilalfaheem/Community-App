import 'package:beam_tv_1/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, this.color = primaryColor}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: CircularProgressIndicator(
              color: color,
              strokeWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}
