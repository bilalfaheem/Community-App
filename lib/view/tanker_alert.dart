import 'package:beam_tv_1/Function/Navigation/navigatePop.dart';
import 'package:beam_tv_1/ViewModel/tanker_alert_view_model.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/components/tanker_alert_tile.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import '../resources/components/content.dart';

void tankerAlert(BuildContext context) {
  String? swapAddressId;
  //  TankerAlertViewModel tankerAlertViewModel = TankerAlertViewModel(initialType:false);
  TextEditingController addressController = TextEditingController();
  final tankerAlertViewModel =
      Provider.of<TankerAlertViewModel>(context, listen: false);
  tankerAlertViewModel.initializeType();
  tankerAlertViewModel.fetchAddressList();
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    // barrierDismissible: true,
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
// tankerAlertViewModel.setType(false);
      return Center(
        child: Material(
          color: Colors.transparent,
          child:
              Consumer<TankerAlertViewModel>(builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: 50.w,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.all(18.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.white),
                  // color: Colors.white,
                  child:
                      // value.orderResponse?
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //           Column(
                      //   children: [
                      //     Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Container(
                      //           width: 1,
                      //         ),
                      //         GestureDetector(
                      //                   onTap: () {
                      //                     navigatePop(context);
                      //                   },
                      //                   child: Container(
                      //                     // margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
                      //                     decoration: BoxDecoration(
                      //                       color: greyLightBg,
                      //                       borderRadius: BorderRadius.circular(10.r),
                      //                     ),
                      //                     child: Image.asset(cut), width: 41.h,
                      //                   ),
                      //                 ),
                      //     ],),
                      //     Image.asset(thumbsUp,width: 100.h,),
                      //     Content(data: "Confirm Successful",size: 12,)
                      //   ],
                      // ),
                      //   ],
                      // ):
                      Column(
                    children: [
                      Container(
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                // margin: EdgeInsets.only(left: 30.h),
                                child: Consumer<TankerAlertViewModel>(
                                    builder: (context, value, child) {
                              return value.orderResponse
                                  ? Content(
                                      data: " ",
                                      size: 18,
                                      weight: FontWeight.bold,
                                    )
                                  : !value.type
                                      ? Content(
                                          data: "Select Tanker Category:",
                                          size: 18,
                                          weight: FontWeight.bold,
                                        )
                                      : value.category == 1
                                          ? Content(
                                              data: "Quota Tanker Type:",
                                              size: 18,
                                              weight: FontWeight.bold,
                                            )
                                          : value.category == 2
                                              ? Content(
                                                  data: "Cash Tanker Type:",
                                                  size: 18,
                                                  weight: FontWeight.bold,
                                                )
                                              : value.category == 3
                                                  ? Content(
                                                      data: "Swap Tanker Type:",
                                                      size: 18,
                                                      weight: FontWeight.bold,
                                                    )
                                                  : Container();
                            })),
                            GestureDetector(
                              onTap: () {
                                navigatePop(context);
                              },
                              child: Container(
                                // margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
                                decoration: BoxDecoration(
                                  color: greyLightBg,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Image.asset(cut), width: 41.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          value.orderResponse
                              ?
                              // AnimatedContainer(
                              //     // opacity: value.orderResponse ? 1 : 0,
                              //     duration: Duration(milliseconds: 400),
                              //     child: Visibility(
                              //         visible: value.orderResponse,
                              //         maintainSize: true,
                              //         maintainAnimation: true,
                              //         maintainState: true,
                              //         child:
                              AnimatedContainer(
                                  duration: Duration(milliseconds: 400),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        value.orderResponseStatus
                                            ? thumbsUp
                                            : thumbsDown,
                                        width: 200.h,
                                      ),
                                      Content(
                                        data: value.orderResponseMsg,
                                        // "Confirm Successful",
                                        size: 22.sp,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      )
                                    ],
                                  ))
                              // ))
                              : Consumer<TankerAlertViewModel>(
                                  builder: (context, value, child) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 15.h, bottom: 10.h),
                                        // padding: EdgeInsets.symmetric( vertical: 16.h,horizontal: 10.h),
                                        child:
                                            // value.type ?
                                            Stack(
                                          children: [
                                            AnimatedOpacity(
                                              opacity: value.swapType ? 1 : 0,
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              child: Visibility(
                                                visible: value.swapType,
                                                maintainSize: true,
                                                maintainAnimation: true,
                                                maintainState: true,
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.h),
                                                            width: 350.w,
                                                            child:
                                                                TypeAheadField(
                                                                    textFieldConfiguration:
                                                                        TextFieldConfiguration(
                                                                      enableInteractiveSelection:
                                                                          false,
                                                                      // enableSuggestions: true,
                                                                      enabled:
                                                                          true,
                                                                      onChanged:
                                                                          (value) {
                                                                        print(
                                                                            "Change value $value");
                                                                        // signupViewModel.setProjectId(
                                                                        //     signupViewModel
                                                                        //         .getSocietyId(
                                                                        //             societyController
                                                                        //                 .text));
                                                                        // print(signupViewModel
                                                                        //     .getSocietyId(
                                                                        //         societyController
                                                                        //             .text));
                                                                      },
                                                                      onEditingComplete:
                                                                          () {
                                                                        print(
                                                                            "donwe");
                                                                      },
                                                                      autofocus:
                                                                          false,
                                                                      controller:
                                                                          addressController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        fillColor:
                                                                            textFieldColor,
                                                                        filled:
                                                                            true,
                                                                        hintText:
                                                                            "Address",
                                                                        hintStyle: TextStyle(
                                                                            color:
                                                                                textFieldHintColor,
                                                                            fontSize:
                                                                                17.sp),
                                                                        counterText:
                                                                            "",
                                                                        contentPadding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                20,
                                                                            vertical:
                                                                                0),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          borderSide: BorderSide(
                                                                              color: primaryColor,
                                                                              width: 2.0),
                                                                        ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          borderSide: BorderSide(
                                                                              color: textFieldColor,
                                                                              width: 2.0),
                                                                        ),
                                                                        // errorStyle: InputDecoration.collapsed(hintText: hintText)
                                                                      ),
                                                                    ),
                                                                    suggestionsCallback:
                                                                        (pattern) {
                                                                      return tankerAlertViewModel
                                                                          .addressList
                                                                          .data!
                                                                          .data!
                                                                          .where((element) => element
                                                                              .address!
                                                                              .toLowerCase()
                                                                              .contains(pattern.toLowerCase()))
                                                                          .toList();
                                                                    },
                                                                    itemBuilder:
                                                                        (context,
                                                                            suggestion) {
                                                                      return ListTile(
                                                                        title: Text(suggestion
                                                                            .address
                                                                            .toString()),
                                                                      );
                                                                    },
                                                                    transitionBuilder:
                                                                        (context,
                                                                            suggestionsBox,
                                                                            controller) {
                                                                      return suggestionsBox;
                                                                    },
                                                                    onSuggestionSelected:
                                                                        (suggestion) {
                                                                      addressController
                                                                              .text =
                                                                          suggestion
                                                                              .address
                                                                              .toString();
                                                                      swapAddressId =
                                                                          suggestion
                                                                              .id
                                                                              .toString();
                                                                      // signupViewModel
                                                                      //     .setProjectId(
                                                                      //         signupViewModel.getSocietyId(societyController.text));
                                                                      // print(signupViewModel
                                                                      //     .getSocietyId(
                                                                      //         societyController.text));
                                                                    }),

                                                            //  ContentField(
                                                            //   hint: "Address",
                                                            //   controller:
                                                            //       addressController,
                                                            //   inputFormat: [
                                                            //     FilteringTextInputFormatter
                                                            //         .allow(RegExp(
                                                            //             '[a-zA-Z0-9]')),
                                                            //   ],
                                                            //   keyboardType:
                                                            //       TextInputType
                                                            //           .streetAddress,
                                                            // ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimatedOpacity(
                                              opacity: value.swapType
                                                  ? 0
                                                  : value.type
                                                      ? 1
                                                      : 0,
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              child: Visibility(
                                                visible: value.swapType
                                                    ? false
                                                    : value.type,
                                                maintainSize: true,
                                                maintainAnimation: true,
                                                maintainState: true,
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TankerAlertTile(
                                                          image: tanki,
                                                          imageHeight: 55.h,
                                                          title:
                                                              "Single\nTanker",
                                                          index: 1,
                                                          type: true),
                                                      TankerAlertTile(
                                                          image: tankiDouble,
                                                          imageHeight: 65.h,
                                                          title:
                                                              "Double\nTanker",
                                                          index: 2,
                                                          type: true),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),

                                            // :
                                            AnimatedOpacity(
                                              opacity: value.type ? 0 : 1,
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              child: Visibility(
                                                visible: !value.type,
                                                maintainSize: true,
                                                maintainAnimation: true,
                                                maintainState: true,
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TankerAlertTile(
                                                        image: tanki,
                                                        imageHeight: 55.h,
                                                        title: "Quota",
                                                        index: 1,
                                                        type: false,
                                                      ),

                                                      TankerAlertTile(
                                                          image: money,
                                                          imageHeight: 61.h,
                                                          title: "Cash",
                                                          index: 2,
                                                          type: false),
                                                      TankerAlertTile(
                                                          image: swap,
                                                          imageHeight: 55.h,
                                                          title: "Swap",
                                                          index: 3,
                                                          type: false),
                                                      // TankerAlertTile(tanki, "Single\nTanker", 55.h,),
                                                      // //  TankerAlertTile(doubletanki, "Double\nTanker", 65.h,)
                                                      //   TankerAlertTile(money, "Cash", 61.h,),
                                                      //     TankerAlertTile(swap, "Swap", 55.h,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      value.typeIndex != 0
                                          ? AnimatedOpacity(
                                              opacity:
                                                  value.typeIndex != 0 ? 1 : 0,
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              child: Visibility(
                                                visible: value.typeIndex != 0,
                                                maintainSize: true,
                                                maintainAnimation: true,
                                                maintainState: true,
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 1000),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 8.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          value.typeIndex == 1
                                                              ? Content(
                                                                  data:
                                                                      "${value.categoryList[value.category - 1]} Single Tanker",
                                                                  size: 18.sp)
                                                              : value.typeIndex ==
                                                                      2
                                                                  ? Content(
                                                                      data:
                                                                          "${value.categoryList[value.category - 1]} Double Tanker",
                                                                      size:
                                                                          18.sp)
                                                                  : Container(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              value.swapType
                                                                  ? PrimaryButton(
                                                                      title:
                                                                          "Confirm",
                                                                      func: () {
                                                                        print(value
                                                                            .swapType);
                                                                        print(
                                                                            "Address Confirm");
                                                                        var d =
                                                                            tankerAlertViewModel.getType();
                                                                        print(
                                                                            d);
                                                                        print(swapAddressId
                                                                            .toString());
                                                                      },
                                                                    )
                                                                  : value.category ==
                                                                          3
                                                                      ? PrimaryButton(
                                                                          title:
                                                                              "Next",
                                                                          func:
                                                                              () {
                                                                            value.setSwapType(true);
                                                                            print("Next");
                                                                          },
                                                                        )
                                                                      : PrimaryButton(
                                                                          title:
                                                                              "Confirm",
                                                                          loading:
                                                                              value.loading,
                                                                          func:
                                                                              () {
                                                                            Map data =
                                                                                {
                                                                              "Type": tankerAlertViewModel.getType(),
                                                                              "User_ID": LocalData.id.toString(),
                                                                              "To_User": LocalData.id.toString(),
                                                                            };
                                                                            value.fetchReqTankerReponse(context,
                                                                                data);
                                                                            // value.ll(!value.loading);
                                                                            print("object");

                                                                            print("${tankerAlertViewModel.getType()}");
                                                                            print(tankerAlertViewModel.category);
                                                                            print(tankerAlertViewModel.typeIndex);
                                                                            print("Confirm");
                                                                          },
                                                                        ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  );
                                }),
                          // SizedBox(height: 10.h),
                          // Container(
                          //   margin: EdgeInsets.only(bottom: 35.h,),
                          //   // padding: EdgeInsets.only(left: 9.h, bottom: 12.h),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       // TankerAlertTiles(money, "Cash", 61.h,),
                          //       // TankerAlertTiles(swap, "Swap", 55.h,),

                          //     ],
                          //   ),
                          // ),
                          // Consumer<TankerAlertViewModel>(
                          //     builder: (context, value, child) {
                          //   return
                          //       : Container();
                          // }),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      );
    },
  );
}
