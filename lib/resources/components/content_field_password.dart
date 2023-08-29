import 'package:beam_tv_1/ViewModel/password_visibility_view_model.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ContentFieldPassword extends StatelessWidget {
  String? label;
  String hint;
  int index;
  TextEditingController controller;
  List<TextInputFormatter> inputFormat;
  // TextInputType textInput;
  ContentFieldPassword({
    super.key,
    this.label,
    required this.hint,
    required this.index,
    required this.controller,
    required this.inputFormat,
    // required this.textInput
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? Container()
            : Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 9.h),
                child: Text(
                  label!,
                  style: TextStyle(fontSize: 19.sp, color: textFieldLabelColor),
                )),
        Container(
          height: 50.h,
          child: Builder(builder: (context) {
            return Consumer<PasswordVisibilityViewModel>(
                builder: (context, value, child) {
              return TextFormField(
                controller: controller,
                maxLength: 30,
                keyboardType: TextInputType.text,
                obscureText: value.getObscure(false, index),
                style: TextStyle(
                    fontSize: 18.sp, color: Color.fromARGB(186, 0, 0, 0)),
                inputFormatters: inputFormat,
                decoration: InputDecoration(
                  fillColor: textFieldColor,
                  filled: true,
                  hintText: hint,
                  hintStyle:
                      TextStyle(color: textFieldHintColor, fontSize: 17.sp),
                  counterText: "",
                  suffixIcon: Container(
                      margin: EdgeInsets.symmetric(vertical: 13.h),
                      child: GestureDetector(
                          onTap: () {
                            value.togglePasswordVisibility(index);
                          },
                          child: Image.asset(
                            value.getObscure(true, index),
                            height: 24.h,
                            width: 24.w,
                          ))),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: textFieldColor, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromARGB(220, 247, 123, 114), width: 2.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromARGB(220, 247, 123, 114), width: 2.0),
                  ),
                  // errorStyle: InputDecoration.collapsed(hintText: hintText)
                ),
                validator: (value) {
                  // if (Login_Api_Validation == false) {
                  //   if (value == null || value.isEmpty)
                  //     return "Enter Mobile Number";
                  //   else if (value.length < 11) {
                  //     return "Enter Correct Number";
                  //   } else {
                  //     return null;
                  //   }
                  // } else if (Login_Api_Validation == true) {
                  //   if (Login_Api_Status == "404") {
                  //     return "Failed";
                  //   } else if (Login_Api_Status == "200") {
                  //     return null;
                  //   }
                  // }
                },
              );
            });
          }),
        )
      ],
    );
  }
}
