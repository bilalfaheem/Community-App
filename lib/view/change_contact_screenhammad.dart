import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/content_field.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../ViewModel/change_contact_view_modelhammad.dart';
import '../resources/utils.dart';

// class ChangeContact extends StatefulWidget {
//   const ChangeContact({super.key});

//   @override
//   State<ChangeContact> createState() => _ChangeContactState();
// }

// class _ChangeContactState extends State<ChangeContact> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class ChangeContactScreen extends StatelessWidget {
  ChangeContactScreen({super.key});

  // TextEditingController changePassword = TextEditingController();
  // EditContactViewModel editContactViewModel = EditContactViewModel();

  @override
  TextEditingController _phoneController = TextEditingController();
  // late TextEditingController _passwordController;

  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);
    final editContactViewModel = Provider.of<ChangeContactViewModel>(context);
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: LinearGradient(colors: blueDarkGradient)),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: headerTransparentWidget(
                      context, 8, "Change Contact", false)),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.r),
                                  topRight: Radius.circular(50.r)),
                              child: Image.asset(patternBg1)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ContentField(
                              label: "Edit Contact :",
                              hint: "  Number",
                              controller: _phoneController,
                              inputFormat: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 45.h,
                            ),

                            PrimaryButton(
                              title: "Confirm",
                              loading: editContactViewModel.loading,
                              func: () {
                                // String reverseString(String input) {
                                //   String reversed = '';
                                //   for (int i = input.length - 1; i >= 0; i--) {
                                //     print(i);
                                //     reversed += input[i];
                                //     print(reversed);
                                //   }
                                //   return reversed;
                                // }

                                // String originalString = "Hello, World!";
                                // String reversedString =
                                //     reverseString(originalString);
                                // print(reversedString); // Output: !dlroW ,olleH

                                if (_phoneController.text.isEmpty) {
                                  Utils.snackBar("Enter Contact", context);
                                } else if (_phoneController.text.length < 9) {
                                  Utils.snackBar("Enter Correct", context);
                                } else {
                                  //////////////////////////////////////////////demo???????????????????????
                                  Map data = {
                                    "ID": "2",
                                    "Contact": _phoneController.text.toString(),
                                  };
                                  editContactViewModel.fetchEditContactList(
                                      context, data);
                                }
                              },
                            ),
                            // profileTile(profileIcon, "Name", "Bilal Faheem"),
                            // profileTile(cnic, "CNIC", "0000-00000000-0"),
                            // profileTile(phone, "Phone Number:", "0332324242"),
                            // profileTile(address, "Address", "Z-204"),
                            // profileTile(society, "Society", "Saima Luxury Home"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
