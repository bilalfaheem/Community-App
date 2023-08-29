import 'package:beam_tv_1/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textFieldWidget(controller, label, hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          margin: EdgeInsets.only(top: 20.h, bottom: 9.h),
          child: Text(
            label,
            style: TextStyle(fontSize: 19.sp, color: textFieldLabelColor),
          )),
      Container(
        height: 50.h,
        child: TextFormField(
          controller: controller,
          maxLength: 11,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 18, color: Color.fromARGB(186, 0, 0, 0)),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: new InputDecoration(
            fillColor: textFieldColor,
            filled: true,
            hintText: hint,
            hintStyle: TextStyle(color: textFieldHintColor, fontSize: 17.sp),
            counterText: "",
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
        ),
      )
    ],
  );
}
