import 'dart:ui';
import 'package:CommunityApp/ViewModel/logout_view_model.dart';
import 'package:CommunityApp/data/response/status.dart';
import 'package:CommunityApp/main.dart';
import 'package:CommunityApp/resources/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'cancel_button.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Material(
              child: Container(
                width: 350.w,
                // margin: EdgeInsets.symmetric(horizontal: 10,),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "LOGOUT",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Are You Sure You Want To Logout.?",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CancelButton(
                            title: "Cancel",
                            func: () {
                              Navigator.pop(context);
                            },
                          ),
                          Consumer<LogoutViewModel>(
                              builder: (context, value, child) {
                            return PrimaryButton(
                              loading:
                                  value.logoutResponse.status == Status.LOADING,
                              title: "OK",
                              // loading: true,
                              func: () {
                                final data = {"fcm_token": tokenId};
                                value.fetchlogoutResponse(data, context);
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
