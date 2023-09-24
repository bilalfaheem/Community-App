import 'package:beam_tv_1/Model/address_data_model/address_data_model.dart';
import 'package:beam_tv_1/Model/address_data_model/datum.dart';
import 'package:beam_tv_1/ViewModel/signup_view_model.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/button2.dart';
import 'package:beam_tv_1/resources/components/content_field.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/ViewModel/slider_provider.dart';
import 'package:beam_tv_1/Widget/TextFieldWidgets/textfield_password_widget.dart';
import 'package:beam_tv_1/Widget/TextFieldWidgets/textfield_widget.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../resources/components/content_field_password.dart';
import '../resources/components/primary_button.dart';

// TextEditingController cc = TextEditingController();
// List<String> _suggestions = [
//   'Option 1',
//   'Option 2',
//   'Option 3',
//   'Option 4',
//   // Add more options as needed
// ];
// TextEditingController addressController = TextEditingController();

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with TickerProviderStateMixin {
  SignupViewModel signupViewModel = SignupViewModel();

  Offset centerPosition = Offset(0, 0);
  Offset leftPosition = Offset(-3, 0);
  Offset rightPosition = Offset(3.0, 0);

  late AnimationController _animationController;
  late AnimationController _animationBackwardController;
  late Animation<Offset> _forwardAnimationCenterLeft;
  late Animation<Offset> _forwardAnimationRightCenter;

  late Animation<Offset> _backwardAnimationCenterRight;
  late Animation<Offset> _backwardAnimationLeftCenter;

  late Animation<Offset> _firstAnimation;
  late Animation<Offset> _secondAnimation;

  // bool action = false;
  // late AnimationController _controller;

  //  = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )
  //  ..repeat(reverse: false);
  // late Animation<Offset> _offsetAnimation;
  // Tween<Offset>(
  //   begin:
  //    Offset(1.5, 0),
  //   // Offset.zero,
  //   end:
  //   Offset(0, 0.0),
  //   // Offset(-2, 0.0),
  // ).animate(CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.easeInCirc,
  // ));

  // _controller.addListener(() { })
  @override
  void initState() {
    super.initState();
    signupViewModel.fetchSocietyList();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animationBackwardController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    // Define the animations for the left and right images
    _forwardAnimationCenterLeft = Tween<Offset>(
      begin: centerPosition,
      end: leftPosition,
    )
        .chain(
          CurveTween(curve: Curves.bounceOut),
        )
        .animate(_animationController);

    _forwardAnimationRightCenter = Tween<Offset>(
      begin: rightPosition,
      end: centerPosition,
    )
        .chain(
          CurveTween(curve: Curves.bounceOut),
        )
        .animate(_animationController);

    _backwardAnimationCenterRight = Tween<Offset>(
      begin: centerPosition,
      end: rightPosition,
    )
        .chain(
          CurveTween(curve: Curves.bounceOut),
        )
        .animate(_animationBackwardController);

    _backwardAnimationLeftCenter = Tween<Offset>(
      begin: leftPosition,
      end: centerPosition,
    )
        .chain(
          CurveTween(curve: Curves.bounceOut),
        )
        .animate(_animationBackwardController);
  }
  // _firstAnimation = _forwardAnimationCenterLeft;
  // _secondAnimation = _forwardAnimationRightCenter;

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

//     _controller = AnimationController(
//     duration: const Duration(milliseconds: 1500),
//     vsync: this,
//   );

//  _offsetAnimation = Tween<Offset>(
//     begin:
//      Offset(1.5, 0),
//     // Offset.zero,
//     end:
//     Offset(0, 0.0),
//     // Offset(-2, 0.0),
//   ).animate(CurvedAnimation(
//     parent: _controller,
//     curve: Curves.easeInCirc,
//   ));

//   _controller.addListener(() {
//     print(_controller.value);
//     print(_offsetAnimation.value);
//     if(_controller.isCompleted){
//       _controller.reset();
//     }
//   });

//   _controller.addStatusListener((status) {
//     // if(status == AnimationStatus.dismissed){
//     print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<${_controller.isDismissed}");
//     // _controller.isDismissed = true;
//     // _controller.isDismissed;
//     //   action = true;
//     // }
//     // else if(status == AnimationStatus.dismissed){
//     //   action = false;

//     // }
//   });
  // }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController societyController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController tenantCnicController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller.forward();
  // }

  @override
  void dispose() {
    _animationController.dispose();
    nameController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(1.h);
    // print(MediaQuery.of(context).size.height);
    final size = MediaQuery.of(context).size;
    SliderProvider sliderProvider =
        Provider.of<SliderProvider>(context, listen: false);
    //  SignupViewModel signupViewModel2 =
    //  Provider.of<SignupViewModel>(context, listen: true);

    void forwardAnimationFunc() {
      print("Project id ${SignupViewModel.projectId}");
      print("Address id ${SignupViewModel.addressId}");
      // print(
      //     "address<<<<< get <<< ${signupViewModel.getAddressId(addressController.text.toString())}");
      // print(signupViewModel.getAddressId(addressController.text.toString()));
      // var dd = signupViewModel.getAddressId(addressController.text.toString());
      // print(dd);

      if ((sliderProvider.step == 0 && nameController.text.isEmpty) ||
          (sliderProvider.step == 0 && phoneController.text.isEmpty)) {
        Utils.snackBar("Fill Required Information", context);
      } else if (sliderProvider.step == 0 && nameController.text.length <= 5) {
        Utils.snackBar("Enter Full Name", context);
      } else if (sliderProvider.step == 0 &&
          phoneController.text.length <= 10) {
        Utils.snackBar("Enter Phone Number", context);
      } else if (sliderProvider.step == 1 && SignupViewModel.projectId == "") {
        Utils.snackBar("Select Society", context);
      }
      // else if (sliderProvider.step == 1 && SignupViewModel.addressId == ""
      //     // phoneController.text.length <= 10
      //     ) {
      //   Utils.snackBar("Enter Address", context);
      // }
      else if (sliderProvider.step == 1
          // phoneController.text.length <= 10
          ) {
        signupViewModel.setAddressId(
            signupViewModel.getAddressId(addressController.text.toString()));
        print("Address id ${SignupViewModel.addressId}");
        if (SignupViewModel.addressId == "") {
          Utils.snackBar("Enter Address", context);
        } else {
          print("<<<<<<<<<<<<<<<<<forwar>>>>>>>>>>>>>>>>>");
          sliderProvider.setForward(true);
          _animationController.forward();
          _animationController.addStatusListener((status) {
            print("Animation Listener $status");
            if (_animationController.isCompleted) {
              print(
                  "<<<<<<<<<<<<<<<<<<<<Forward func >>>>>>>>>>>>>$status>>>>>>>");
              sliderProvider.stepFunc(true);
              _animationController.removeStatusListener((status) {});
              _animationController.reset();
            }
          });
        }
      } else if (sliderProvider.step == 2 && cnicController.text.isEmpty ||
          sliderProvider.step == 2 && cnicController.text.length < 13) {
        Utils.snackBar("Enter Owner Cnic", context);
      } else if (sliderProvider.step == 2 &&
              sliderProvider.tenant &&
              tenantCnicController.text.isEmpty ||
          sliderProvider.step == 2 &&
              sliderProvider.tenant &&
              tenantCnicController.text.length < 13) {
        Utils.snackBar("Enter Tenant Cnic", context);
      } else if (sliderProvider.step == 3 && passwordController.text.isEmpty) {
        Utils.snackBar("Enter Password", context);
      } else if (sliderProvider.step == 3 &&
          passwordController.text.length < 8) {
        Utils.snackBar("Enter 8 Characters Password", context);
      } else if (sliderProvider.step == 3 &&
          passwordCheckController.text != passwordController.text) {
        Utils.snackBar("Unmatched Password", context);
      } else {
        if (sliderProvider.step < 3) {
          print("forwarrd");
          sliderProvider.setForward(true);
          _animationController.forward();
          _animationController.addStatusListener((status) {
            print("Animation Listener $status");
            if (_animationController.isCompleted) {
              print(
                  "<<<<<<<<<<<<<<<<<<<<Forward func >>>>>>>>>>>>>$status>>>>>>>");
              sliderProvider.stepFunc(true);
              _animationController.removeStatusListener((status) {});
              _animationController.reset();
            }
          });
        } else if (sliderProvider.step == 3) {
          Map<String, String> signUpData = {
            "full_name": nameController.text,
            "phone": phoneController.text,
            "project_id": SignupViewModel.projectId.toString(),
            "address": SignupViewModel.addressId.toString(),
            "owner_cnic": cnicController.text,
            "password": passwordCheckController.text
          };
          print("<<<<<<<<<<<signupData$signUpData>>>>>>>>>>>");
          signupViewModel.fetchsignUpReponse(context, signUpData).then((value) {
            if (value == true) {
              sliderProvider.setStep(0);
            }
          });
        }

        // setState(() {
        // _firstAnimation = _forwardAnimationCenterLeft;
        // _secondAnimation = _forwardAnimationRightCenter;
        // });
      }
    }

    void backwardAnimationFunc() {
      if (sliderProvider.step == 0) {
        Navigator.pop(context);
      } else {
        print("Backward");
        sliderProvider.setForward(false);
        // setState(() {
        // _firstAnimation = _backwardAnimationCenterRight;
        // _secondAnimation = _backwardAnimationLeftCenter;
        // });

        // setState(() {

        // });
        _animationBackwardController.forward();
        _animationBackwardController.addStatusListener((status) {
          print("Animation Listener $status");
          if (_animationBackwardController.isCompleted) {
            print(
                "<<<<<<<<<<<<<<<<<<<<Backward func >>>>>>>>>>>>>$status>>>>>>>");
            sliderProvider.stepFunc(false);
            _animationBackwardController.removeStatusListener((status) {});
            _animationBackwardController.reset();
          }
        });
      }
    }

    // List<String> getSuggestions(String query) {
    //   List<String> matches = [];
    //   matches.addAll(suggestions);

    //   matches.retainWhere((suggestion) =>
    //       suggestion.toLowerCase().contains(query.toLowerCase()));
    //   return matches;
    //   // .take(5).toList();
    // }

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          height: size.height,
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Container(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(patternBg1),
                          Positioned(
                            top: 70.h,
                            child: Padding(
                              padding: EdgeInsets.only(right: 80.w, left: 67.w),
                              child: Consumer<SliderProvider>(
                                  builder: (context, value, child) {
                                return value.forward
                                    ? Stack(
                                        children: [
                                          SlideTransition(
                                            position:
                                                _forwardAnimationCenterLeft,
                                            child: Image.asset(
                                              value.step == 0
                                                  ? profile
                                                  : value.step == 1
                                                      ? building
                                                      : value.step == 2
                                                          ? cloud
                                                          : value.step == 3
                                                              ? password
                                                              : profile,
                                              width: 281.w,
                                              height: 229.h,
                                            ),
                                          ),
                                          SlideTransition(
                                              position:
                                                  _forwardAnimationRightCenter,
                                              child: Image.asset(
                                                value.step + 1 == 0
                                                    ? profile
                                                    : value.step + 1 == 1
                                                        ? building
                                                        : value.step + 1 == 2
                                                            ? cloud
                                                            : value.step + 1 ==
                                                                    3
                                                                ? password
                                                                : profile,
                                                width: 281.w,
                                                height: 229.h,
                                              ))
                                        ],
                                      )
                                    : Stack(
                                        children: [
                                          SlideTransition(
                                            position:
                                                _backwardAnimationCenterRight,
                                            child: Image.asset(
                                              value.step == 0
                                                  ? profile
                                                  : value.step == 1
                                                      ? building
                                                      : value.step == 2
                                                          ? cloud
                                                          : value.step == 3
                                                              ? password
                                                              : profile,
                                              width: 281.w,
                                              height: 229.h,
                                            ),
                                          ),
                                          SlideTransition(
                                              position:
                                                  _backwardAnimationLeftCenter,
                                              child: Image.asset(
                                                value.step - 1 == 0
                                                    ? profile
                                                    : value.step - 1 == 1
                                                        ? building
                                                        : value.step - 1 == 2
                                                            ? cloud
                                                            : value.step - 1 ==
                                                                    3
                                                                ? password
                                                                : profile,
                                                width: 281.w,
                                                height: 229.h,
                                              ))
                                        ],
                                      );
                              }),
                            ),
                          ),
                          //    Positioned(
                          //   top: 70.h,
                          //   child: Padding(
                          //     padding: EdgeInsets.only(right: 80.w, left: 67.w),
                          //     child: Consumer<SliderProvider>(
                          //         builder: (context, value, child) {
                          //       return SlideTransition(
                          //         position: _secondAnimation,
                          //         child: Image.asset(
                          //           value.step+1 == 0
                          //               ? profile
                          //               : value.step+1 == 1
                          //                   ? building
                          //                   : value.step+1 == 2
                          //                       ? cloud
                          //                       : value.step+1 == 3
                          //                           ? password
                          //                           : profile,
                          //           width: 281.w,
                          //           height: 229.h,
                          //         ),
                          //       );
                          //     }),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Consumer<SliderProvider>(builder: (context, value, child) {
                      // print("build");
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 150.h),
                              child: Image.asset(
                                  value.step == 0
                                      ? progressBar1
                                      : value.step == 1
                                          ? progressBar2
                                          : value.step == 2
                                              ? progressBar3
                                              : value.step == 3
                                                  ? progressBar4
                                                  : progressBar1,
                                  width: 230.w)),

                          // Image.asset(progressBar1,width: 230.w,)),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: value.step == 2 ? 10.h : 60.h,
                                top: 23.h),
                            child: Text(
                                value.step == 0
                                    ? "PERSONAL INFO"
                                    : value.step == 1
                                        ? "SOCIETY"
                                        : value.step == 2
                                            ? "MEMBER TYPE"
                                            : value.step == 3
                                                ? "PASSWORD"
                                                : "",
                                style: GoogleFonts.lato(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          value.step == 2
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 30.h),
                                  padding: EdgeInsets.all(4.h),
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          value.tenantFunc(false);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: value.tenant
                                                ? primaryColor
                                                : Colors.white,
                                          ),
                                          child: Text(
                                            "Owner",
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                color: value.tenant
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          value.tenantFunc(true);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: value.tenant
                                                ? Colors.white
                                                : primaryColor,
                                          ),
                                          child: Text(
                                            "Tenant",
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                color: value.tenant
                                                    ? Colors.black
                                                    : Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                value.step == 0
                                    ? Column(
                                        children: [
                                          ContentField(
                                            label: "Full Name",
                                            hint: "Full Name",
                                            controller: nameController,
                                            inputFormat: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[a-zA-Z ]')),
                                            ],
                                            keyboardType: TextInputType.text,
                                            maxLength: 15,
                                          ),
                                          // textFieldWidget(nameController,
                                          //     "Full Name:", 'Full Name'),
                                          ContentField(
                                            label: "Phone Number",
                                            hint: "Phone Number",
                                            controller: phoneController,
                                            inputFormat: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                            keyboardType: TextInputType.phone,
                                            maxLength: 11,
                                          ),
                                          // textFieldWidget(phoneController,
                                          //     "Phone Number:", 'Phone Number'),
                                        ],
                                      )
                                    : value.step == 1
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20.h, bottom: 9.h),
                                                  child: Text(
                                                    "Society",
                                                    style: TextStyle(
                                                        fontSize: 19.sp,
                                                        color:
                                                            textFieldLabelColor),
                                                  )),
                                              TypeAheadField(
                                                  textFieldConfiguration:
                                                      TextFieldConfiguration(
                                                    enableInteractiveSelection:
                                                        false,
                                                    // enableSuggestions: true,
                                                    enabled: true,
                                                    onChanged: (value) {
                                                      print(
                                                          "Change value $value");
                                                      signupViewModel.setProjectId(
                                                          signupViewModel
                                                              .getSocietyId(
                                                                  societyController
                                                                      .text));
                                                      print(signupViewModel
                                                          .getSocietyId(
                                                              societyController
                                                                  .text));
                                                    },
                                                    onEditingComplete: () {
                                                      print("donwe");
                                                    },
                                                    autofocus: false,
                                                    controller:
                                                        societyController,
                                                    decoration: InputDecoration(
                                                      fillColor: textFieldColor,
                                                      filled: true,
                                                      hintText: "Society",
                                                      hintStyle: TextStyle(
                                                          color:
                                                              textFieldHintColor,
                                                          fontSize: 17.sp),
                                                      counterText: "",
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 0),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: primaryColor,
                                                            width: 2.0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                textFieldColor,
                                                            width: 2.0),
                                                      ),
                                                      // errorStyle: InputDecoration.collapsed(hintText: hintText)
                                                    ),
                                                  ),
                                                  suggestionsCallback:
                                                      (pattern) {
                                                    return signupViewModel
                                                        .societyList.data!.data!
                                                        .where((element) => element
                                                            .projectTitle!
                                                            .toLowerCase()
                                                            .contains(pattern
                                                                .toLowerCase()))
                                                        .toList();

                                                    //    //  _suggestions
                                                    // signupViewModel.societyList.data!.data!.first.projectTitle!
                                                    //     .where((suggestion) =>
                                                    //         suggestion
                                                    //             .toLowerCase()
                                                    //             .contains(pattern
                                                    //                 .toLowerCase()))
                                                    //     .toList();
                                                  },
                                                  itemBuilder:
                                                      (context, suggestion) {
                                                    return ListTile(
                                                      title: Text(suggestion
                                                          .projectTitle
                                                          .toString()),
                                                    );
                                                  },
                                                  transitionBuilder: (context,
                                                      suggestionsBox,
                                                      controller) {
                                                    return suggestionsBox;
                                                  },
                                                  onSuggestionSelected:
                                                      (suggestion) {
                                                    societyController.text =
                                                        suggestion.projectTitle
                                                            .toString();
                                                    signupViewModel.setProjectId(
                                                        signupViewModel
                                                            .getSocietyId(
                                                                societyController
                                                                    .text));
                                                    print(signupViewModel
                                                        .getSocietyId(
                                                            societyController
                                                                .text));
                                                  }),

                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20.h, bottom: 9.h),
                                                  child: Text(
                                                    "Full Address",
                                                    style: TextStyle(
                                                        fontSize: 19.sp,
                                                        color:
                                                            textFieldLabelColor),
                                                  )),
                                              TypeAheadField<Datum>(
                                                textFieldConfiguration:
                                                    TextFieldConfiguration(
                                                  enableInteractiveSelection:
                                                      false,
                                                  // enableSuggestions: true,
                                                  enabled: true,
                                                  onEditingComplete: () {
                                                    print("donwe");
                                                  },
                                                  onChanged: (value) {
                                                    print(
                                                        "address<<<<<<<<<<<<<<<<<<<<<<<< $value");
                                                    // signupViewModel.setAddressId(
                                                    //     signupViewModel
                                                    //         .getAddressId(
                                                    //             addressController
                                                    //                 .text
                                                    //                 .toString()));
                                                    // print(signupViewModel
                                                    //     .getAddressId(
                                                    //         "address get ${addressController.text.toString()}"));
                                                  },
                                                  // on
                                                  autofocus: false,
                                                  controller: addressController,
                                                  decoration: InputDecoration(
                                                    fillColor: textFieldColor,
                                                    filled: true,
                                                    hintText: "Full Address",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            textFieldHintColor,
                                                        fontSize: 17.sp),
                                                    counterText: "",
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 0),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: primaryColor,
                                                          width: 2.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: textFieldColor,
                                                          width: 2.0),
                                                    ),
                                                    // errorStyle: InputDecoration.collapsed(hintText: hintText)
                                                  ),
                                                ),
                                                suggestionsCallback:
                                                    SignupViewModel
                                                        .getAddresses,
                                                // (pattern) {
                                                //   return signupViewModel.societyList.data!.data!.where((element)=>
                                                //     element.projectTitle!.toLowerCase().contains(pattern.toLowerCase())).toList();
                                                // },
                                                itemBuilder:
                                                    (context, suggestion) {
                                                  return ListTile(
                                                    title: Text(suggestion
                                                        .address
                                                        .toString()),
                                                  );
                                                },
                                                loadingBuilder: (context) =>
                                                    Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    CircularProgressIndicator(
                                                      strokeWidth: 1,
                                                      color: primaryColor,
                                                    ),
                                                  ],
                                                ),
                                                transitionBuilder: (context,
                                                    suggestionsBox,
                                                    controller) {
                                                  return suggestionsBox;
                                                },
                                                onSuggestionSelected:
                                                    (suggestion) {
                                                  addressController.text =
                                                      suggestion.address
                                                          .toString();
                                                  // signupViewModel.fetchAddressList();
                                                  // print(signupViewModel
                                                  //     .getAddressId(
                                                  //         addressController.text
                                                  //             .toString()));

                                                  // signupViewModel.setAddressId(
                                                  //     signupViewModel
                                                  //         .getAddressId(
                                                  //             addressController
                                                  //                 .text
                                                  //                 .toString()));
                                                },
                                              ),
                                              // textFieldWidget(addressController,
                                              //     "Address:", 'Full Address'),
                                            ],
                                          )
                                        : value.step == 2
                                            ? Column(
                                                children: [
                                                  ContentField(
                                                    label: "Owner CNIC",
                                                    hint: '00000-0000000-0',
                                                    controller: cnicController,
                                                    inputFormat: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    maxLength: 13,
                                                  ),
                                                  // textFieldWidget(
                                                  //     cnicController,
                                                  //     "Owner CNIC:",
                                                  //     '00000-0000000-0'),
                                                  value.tenant
                                                      ? ContentField(
                                                          label: "Tenant CNIC",
                                                          hint:
                                                              '00000-0000000-0',
                                                          maxLength: 13,
                                                          controller:
                                                              tenantCnicController,
                                                          inputFormat: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                        )
                                                      // ,
                                                      //     textFieldWidget(
                                                      //         tenantCnicController,
                                                      //         "Tenant CNIC:",
                                                      //         '00000-0000000-0')
                                                      : Container(
                                                          height: 113.h,
                                                        )
                                                ],
                                              )
                                            : value.step == 3
                                                ? Column(
                                                    children: [
                                                      ContentFieldPassword(
                                                          label:
                                                              "  New Password",
                                                          hint: "New Password",
                                                          index: 2,
                                                          controller:
                                                              passwordController,
                                                          inputFormat: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ]),
                                                      ContentFieldPassword(
                                                          label:
                                                              "  Confirm Password",
                                                          hint: "Confirm Password",
                                                          index: 3,
                                                          controller: passwordCheckController,
                                                          inputFormat: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .singleLineFormatter
                                                          ]),
                                                      // textFieldPasswordWidget(
                                                      //     passwordController,
                                                      //     "New Password:",
                                                      //     'New Password'),
                                                      // textFieldPasswordWidget(
                                                      //     passwordCheckController,
                                                      //     "Confirm Password:",
                                                      //     'Confirm Password'),
                                                    ],
                                                  )
                                                : Column(
                                                    children: [],
                                                  ),

                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          backwardAnimationFunc();

                                          //  sliderProvider.stepFunc(false);
                                        },
                                        child: Image.asset(
                                          back,
                                          height: 33.5.h,
                                          width: 33.5.w,
                                        )),
                                    Button2(
                                        loading: value.loading,
                                        onPress: () {
                                          forwardAnimationFunc();
                                        })
                                  ],
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(top: 8.h,bottom: 26.h),
                                //   child: Text("Forget Password?",style: TextStyle(
                                //     fontFamily:"Rhizome",
                                //     fontSize: 17.sp,color: orangeDull),)),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Container(
                                //       margin: EdgeInsets.only(top:26.h),
                                //       child: Row(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           Text("CREATE AN ACCOUNT : ",style: TextStyle(fontSize: 13.sp),),
                                //           Text("SIGN UP",style: TextStyle(fontSize: 15.sp),),
                                //         ],
                                //       ))
                                //   ],
                                // ),

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
                        ],
                      );
                    }),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 40.w),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       GestureDetector(
                    //           onTap: () {
                    //             // Navigator.pop(context);
                    //             // sliderProvider.step == 0
                    //             //     ? Navigator.pop(context)
                    //             //     :
                    //             backwardAnimationFunc();

                    //             //  sliderProvider.stepFunc(false);
                    //           },
                    //           child: Image.asset(
                    //             back,
                    //             height: 33.5.h,
                    //             width: 33.5.w,
                    //           )),
                    //       // Consumer<SignupViewModel>(
                    //       //     builder: (context, value, child) {
                    //       // Consumer<SignupViewModel>(builder: (context,value,child){
                    //       // return
                    //       // Button2(
                    //       //      loading: signupViewModel2.loading,
                    //       //     onPress: () {
                    //       //   forwardAnimationFunc();
                    //       // })
                    //       // ;
                    //       // })
                    //           // })
                    //       // ElevatedButton(
                    //       //     style: ElevatedButton.styleFrom(
                    //       //         primary: orange,
                    //       //         // shadowColor: Colors.transparent,
                    //       //         // onPrimary: itemGradient1Light,
                    //       //         // animationDuration: defaultAnimationDelay,
                    //       //         shape: RoundedRectangleBorder(
                    //       //             borderRadius:
                    //       //                 BorderRadius.circular(
                    //       //                     10.r))),
                    //       //     onPressed: () {
                    //       //       forwardAnimationFunc();

                    //       //       // sliderProvider.stepFunc(true);
                    //       //       // if(action){
                    //       //       //   // action = true;
                    //       //       //   _controller.reverse();
                    //       //       // } else if(action == false){
                    //       //       //   // action = false;
                    //       //       //   _controller.forward();
                    //       //       // }
                    //       //       // print(action);
                    //       //       // _controller.forward();
                    //       //       // Navigator.push(
                    //       //       //     context,
                    //       //       //     MaterialPageRoute(
                    //       //       //         builder: (context) => NavBarScreen()));
                    //       //     },
                    //       //     child: Padding(
                    //       //       padding: EdgeInsets.symmetric(
                    //       //           horizontal: 30.w, vertical: 15.h),
                    //       //       child: Text("NEXT",
                    //       //           style: TextStyle(
                    //       //               fontFamily: "Rhizome",
                    //       //               fontSize: 15.sp,
                    //       //               fontWeight: FontWeight.w600,
                    //       //               color: Colors.white)),
                    //       //     )),
                    //     ],
                    //   ),
                    // ),
                  ]),
                  Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Spacer(),
                      Image.asset(patternBg2),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
