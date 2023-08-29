import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/content_field_password.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../ViewModel/change_password_view_modelhammad.dart';
import '../resources/utils.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    final changePasswordViewModel =
        Provider.of<ChangePasswordViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //  height: sizeConfig.height(1),
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: blueDarkGradient)),
        child: Container(
          // height: sizeConfig.height(1),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: headerTransparentWidget(
                        context, 8, "Change Password", false)),
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.r),
                            topRight: Radius.circular(50.r))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                topRight: Radius.circular(50.r)),
                            child: Image.asset(patternbg3)),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 35.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContentFieldPassword(
                                  label: "  Current Password",
                                  hint: "Current Password",
                                  index: 1,
                                  controller: currentPassword,
                                  inputFormat: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .singleLineFormatter
                                  ]),
                              ContentFieldPassword(
                                  label: "  New Password",
                                  hint: "New Password",
                                  index: 2,
                                  controller: newPassword,
                                  inputFormat: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .singleLineFormatter
                                  ]),
                              ContentFieldPassword(
                                  label: "  Confirm Password",
                                  hint: "Confirm Password",
                                  index: 3,
                                  controller: confirmPassword,
                                  inputFormat: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .singleLineFormatter
                                  ]),
                              SizedBox(
                                height: 50.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  PrimaryButton(
                                    loading: changePasswordViewModel.loading,
                                    title: "Confirm",
                                    func: () {
                                      if (currentPassword.text.isEmpty) {
                                        Utils.snackBar(
                                            "Enter Password", context);
                                      } else if (newPassword.text.isEmpty) {
                                        Utils.snackBar(
                                            "Enter New Password", context);
                                      } else if (newPassword.text.length < 8) {
                                        Utils.snackBar(
                                            "Enter Minium 8 Characters of Password",
                                            context);
                                      } else if (confirmPassword.text.isEmpty) {
                                        Utils.snackBar(
                                            "Enter Confirm Password", context);
                                      } else if (newPassword.text !=
                                          confirmPassword.text) {
                                        Utils.snackBar(
                                            "Passwords do not match", context);
                                      } else {
                                        Map data = {
                                          "ID": "2",
                                          "Password":
                                              currentPassword.text.toString(),
                                          "New_password":
                                              newPassword.text.toString(),
                                          "Confirm_password":
                                              confirmPassword.text.toString(),
                                        };
                                        changePasswordViewModel
                                            .fetchchangePasswordList(
                                                context, data);
                                      }
                                      // if (currentPassword.text)
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
