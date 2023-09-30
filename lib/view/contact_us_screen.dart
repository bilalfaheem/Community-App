import 'package:beam_tv_1/ViewModel/contact_us_view_model.dart';
import 'package:beam_tv_1/data/response/status.dart';
import 'package:beam_tv_1/resources/components/contact_us_tile.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resources/color.dart';
import '../resources/components/header_widget.dart';
import '../resources/image.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  ContactUsViewModel contactUsViewModel = ContactUsViewModel();

  @override
  void initState() {
    contactUsViewModel.fetchContactUsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: blueDarkGradient)),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: headerTransparentWidget(
                        context, 8, "Contact Us", false)),
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: Container(
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
                                child: Image.asset(patternbg3)),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 22.h, right: 22.h),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 12.5.h),
                                    child: Content(
                                      data: "Terms and conditions",
                                      size: 22.h,
                                      weight: FontWeight.bold,
                                    )),
                                ChangeNotifierProvider<ContactUsViewModel>(
                                    create: (BuildContext context) =>
                                        contactUsViewModel,
                                    child: Consumer<ContactUsViewModel>(
                                      builder: (context, value, child) {
                                        switch (value.contactUsList.status) {
                                          case Status.INIT:
                                            return Container();
                                          case Status.LOADING:
                                            return Loading();
                                          case Status.ERROR:
                                            return Center(
                                              child: Content(
                                                  data: value
                                                      .contactUsList.message
                                                      .toString(),
                                                  size: 18),
                                            );
                                          case Status.COMPLETED:
                                            var contactUsData = value
                                                .contactUsList
                                                .data!
                                                .contactUsData;
                                            // var phoneNumber =
                                            //     contactUsData!.phone;
                                            return Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    ContactUsTile(
                                                        Title: contactUsData!
                                                            .content
                                                            .toString()),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 27.h,
                                                          bottom: 20.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          25.h),
                                                              child:
                                                                  Image.asset(
                                                                logo,
                                                                width: 28.h,
                                                              )),
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  Uri phoneno = Uri.parse('tel:' +
                                                                      contactUsData
                                                                          .phone
                                                                          .toString());
                                                                  await launchUrl(
                                                                      phoneno);

                                                                  // if (await launchUrl(
                                                                  //     phoneno)) {
                                                                  //   //dialer opened
                                                                  // } else {
                                                                  //   // AlertDialog(
                                                                  //   //   title: Text(
                                                                  //   //       'Error'),
                                                                  //   //   content: Text(
                                                                  //   //       'Unable to open the phone dialer.'),
                                                                  //   //   actions: [
                                                                  //   //     TextButton(
                                                                  //   //       onPressed:
                                                                  //   //           () {
                                                                  //   //         Navigator.pop(context);
                                                                  //   //       },
                                                                  //   //       child:
                                                                  //   //           Text('OK'),
                                                                  //   //     ),
                                                                  //   //   ],
                                                                  //   // );
                                                                  // }
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(12
                                                                              .r),
                                                                      color:
                                                                          orange),
                                                                  width: 40.h,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(8
                                                                              .h),
                                                                  child: Image
                                                                      .asset(
                                                                    phone,
                                                                    color: Colors
                                                                        .white,
                                                                    width: 19.h,
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  final Uri emailUri = Uri(
                                                                      scheme:
                                                                          'mailto',
                                                                      path: contactUsData
                                                                          .email // Replace with the email address you want to pre-fill
                                                                      );

                                                                  await launchUrl(
                                                                      emailUri);
                                                                  // AlertDialog(
                                                                  //   title: Text(
                                                                  //       'Error'),
                                                                  //   content: Text(
                                                                  //       'Unable to open the email app.'),
                                                                  //   actions: [
                                                                  //     TextButton(
                                                                  //       onPressed:
                                                                  //           () {
                                                                  //         Navigator.of(context).pop();
                                                                  //       },
                                                                  //       child:
                                                                  //           Text('OK'),
                                                                  //     ),
                                                                  //   ],
                                                                  // );
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10.h),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(12
                                                                              .r),
                                                                      color:
                                                                          orange),
                                                                  width: 40.h,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(8
                                                                              .h),
                                                                  child: Image
                                                                      .asset(
                                                                    mail,
                                                                    color: Colors
                                                                        .white,
                                                                    width: 19.h,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          case null:
                                        }
                                        return Container();
                                      },
                                    )),
                                // ContactUsTile(
                                //     Title:
                                //         "Terms and Conditions” is the document governing"),
                                // ContactUsTile(
                                //     Title:
                                //         "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                                // ContactUsTile(
                                //     Title:
                                //         "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                                // ContactUsTile(
                                //     Title:
                                //         "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                                // ContactUsTile(
                                //     Title:
                                //         "Terms and Conditions” is the document governing the contractual relationship between the provider of a service and its user"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
