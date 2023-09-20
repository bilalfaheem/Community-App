import 'package:beam_tv_1/ViewModel/login_view_model.dart';
import 'package:beam_tv_1/resources/components/button1.dart';
import 'package:beam_tv_1/resources/components/content_field.dart';
import 'package:beam_tv_1/resources/components/content_field_password.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/resources/sizeconfig.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:beam_tv_1/view/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    SizeConfig sizeConfig = SizeConfig(context);
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: sizeConfig.height(1),
        child: SingleChildScrollView(
          child: Container(
            height: sizeConfig.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Container(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(patternBg1),
                        Positioned(
                          top: 105.h,
                          child: Padding(
                            padding: EdgeInsets.only(right: 80.w, left: 67.w),
                            child: Image.asset(
                              lock,
                              width: 281.w,
                              height: 229.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 170.h, bottom: 30.h),
                    child: Text("WELCOME",
                        style: GoogleFonts.lato(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContentField(
                          label: "CNIC/ Phone Number",
                          hint: "CNIC/ Phone Number",
                          controller: _phoneController,
                          inputFormat: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.phone,
                        ),
                        // textFieldWidget(_phoneController,"CNIC / Phone Number:",'CNIC / Phone Number'),
                        ContentFieldPassword(
                            label: "Password",
                            hint: "Password",
                            index: 1,
                            // textInput: TextInputType.text,
                            controller: _passwordController,
                            inputFormat: <TextInputFormatter>[
                              FilteringTextInputFormatter.singleLineFormatter
                            ]),
                        // textFieldPasswordWidget(_passwordController,"Password:",'Password'),
                        Container(
                            margin: EdgeInsets.only(top: 8.h, bottom: 26.h),
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                  fontFamily: "Rhizome",
                                  fontSize: 17.sp,
                                  color: orangeDull),
                            )),
                        Button1(
                          loading: loginViewModel.loading,
                          onPress: () {
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

                            // LocalData().getTokenLocally();
                            // print(LocalData.name.toString());   // ???????
                            if (_phoneController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              Utils.snackBar("Enter Credentials", context);
                              // }
                              // else if (_phoneController.text.length < 9 ||
                              //     _passwordController.text.length < 6) {
                              //   Utils.snackBar("Wrong Credentials", context);
                            } else {
                              Map data = {
                                "CNIC_Phone": _phoneController.text.toString(),
                                "password": _passwordController.text.toString(),
                                "fcm_token": LocalData.society.toString(),
                              };
                              loginViewModel.fetchLoginReponse(context, data);
                            }
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       width: 295.w,
                        //       height:44.h,
                        //       child: ElevatedButton(
                        //           style: ElevatedButton.styleFrom(
                        //               primary: orange,
                        //               // shadowColor: Colors.transparent,
                        //               // onPrimary: itemGradient1Light,
                        //               // animationDuration: defaultAnimationDelay,
                        //               shape: RoundedRectangleBorder(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10))),
                        //           onPressed: () {
                        //             // navigate(context, NavBarScreen());
                        //           },
                        //           child: Text("LOGIN",
                        //               style: TextStyle(
                        //                   fontFamily: "Rhizome",
                        //                   fontSize: 15.h,
                        //                   fontWeight: FontWeight.w600,
                        //                   color: Colors.white))),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 26.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CREATE AN ACCOUNT : ",
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          navigate(context, SignupScreen());
                                          // Navigator.push(context, MaterialPageRoute(builder: ((context) => SignupScreen())));
                                          //  BaseApiServices bb = BaseApiServices();
                                        },
                                        child: Text(
                                          "SIGN UP",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ))
                          ],
                        ),

                        // Container(
                        //   padding: EdgeInsets.only(top: 300),
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(image: AssetImage(patternBg1,),fit: BoxFit.fitWidth)
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         // margin: EdgeInsets.only(top: 200.h),
                        //         child:Image.asset(lock,width: 281.w,height: 229.h,) ,
                        //       ),
                      ],
                    ),
                  )
                ]),
                Image.asset(patternBg2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
