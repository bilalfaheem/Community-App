import 'package:CommunityApp/Function/Navigation/navigate.dart';
import 'package:CommunityApp/resources/components/content.dart';
import 'package:CommunityApp/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupSuccessfullScreen extends StatelessWidget {
  String msg;
  SignupSuccessfullScreen({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.3.sh),
            child: Content(data: msg, size: 20.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 26.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GOTO : ",
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      GestureDetector(
                          onTap: () {
                            navigatePushReplace(context, LoginScreen());
                            // Navigator.push(context, MaterialPageRoute(builder: ((context) => SignupScreen())));
                            //  BaseApiServices bb = BaseApiServices();
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
