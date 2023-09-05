import 'package:beam_tv_1/ViewModel/generate_pass_alert_view_model.dart';
import 'package:beam_tv_1/resources/components/add_contact_tile.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/content_field.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:beam_tv_1/view/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void addContactAlert(BuildContext context) {
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 450),
    transitionBuilder: (_, anim, __, child) {
      final tween = Tween(begin: Offset(0, 1), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInQuad));
      // Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      // }

      return SlideTransition(
        position: tween.animate(anim),
        child:
            //  SliverFadeTransition(
            //   opacity: anim,
            //   sliver: child,
            // )
            FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
    pageBuilder: (_, __, ___) {
      return SafeArea(
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  // padding: EdgeInsets.all(18.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.white),
                  // color: Colors.white,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Content(
                            data: "Add Contact",
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          Divider(
                            height: 1.h,
                            color: Colors.black,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                      // AddContactTile(hint: "Name"),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.h),
                        child: ContentField(
                          hint: "Name",
                          controller: contactNameController,
                          maxLength: 15,
                          inputFormat: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z 0-9]')),
                          ],
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.h),
                        child: ContentField(
                          hint: "Contact",
                          maxLength: 11,
                          controller: contactNumberController,
                          inputFormat: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      // AddContactTile(hint:/ "Contact"),
                      Container(
                        padding:
                            EdgeInsets.only(top: 30.h, left: 35.h, right: 35.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CancelButton(
                              title: "Cancel",
                              func: () {},
                            ),
                            Consumer<GeneratePassAlertViewModel>(
                              builder: (context,value,child) {
                                return PrimaryButton(
                                  loading: value.addContactloading,
                                  title: "Add",
                                  func: () {
                                    if (contactNameController.text.isEmpty) {
                                      Utils.snackBar("Enter Name", context);
                                    } else if (contactNameController.text.length <
                                        3) {
                                      Utils.snackBar("Enter Correct Name", context);
                                    } else if (contactNumberController
                                        .text.isEmpty) {
                                      Utils.snackBar("Enter Number", context);
                                    } else if (contactNumberController.text.length <
                                        11) {
                                      Utils.snackBar(
                                          "Enter Correct Number", context);
                                    } else {
                                      Map data = {
                                        "User_ID": LocalData.id,
                                        'Contact_Name':
                                            contactNameController.text.toString(),
                                        'Contact_Phone':
                                            contactNumberController.text.toString(),
                                      };
value.fetchAddContactResponse(context, data);
                                      // addContactViewModel.fetchAddContactList(context, data);
                                    }
                                  },
                                );
                              }
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// TextField(
//                       decoration: InputDecoration(
//                         fillColor: greyLightBg,
//                         filled: false,
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r), borderSide: BorderSide(color: greyTextLight)),
//                         hintText: "Name",
//                       ),
//                     ),
