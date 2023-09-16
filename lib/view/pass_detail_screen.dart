import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/Model/generate_pass_data_model/data.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/cancel_button.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/components/tanker_detail_field.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:beam_tv_1/view/pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';


class PassDetailScreen extends StatelessWidget {
  PassDetailScreen({super.key, required this.data});
  Data data;
  // ScreenshotController passImage = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          headerWidget(context, 8, "Generate Gate Pass", false, true),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            // color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Spacer(),
                  // Expanded(
                  //   flex: 2,
                  //   child: SizedBox(
                  //     height: 2,
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: greyLightBg,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        // Screenshot(
                        //   controller: passImage,
                        //   child:
                        PrettyQr(
                          size: 150.h,
                          data: data.pass!.userRelation!.qrCode.toString(),
                          roundEdges: true,
                        ),
                        // ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            tankerDetailField(
                                "Name",
                                data.passUser!.userContactRelation!.contactName
                                    .toString(),
                                1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField(
                                "Pass Type",
                                data.pass!.passTypeRelation!.name.toString(),
                                1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField(
                                "Event",
                                data.pass!.passEventRelation!.name.toString(),
                                1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField("Address", LocalData.address, 1),
                          ],
                        ),
                        Row(
                          children: [
                            tankerDetailField(
                                "Expiry",
                                Utils.dateTimeFormat(
                                    data.pass!.endDate.toString()),
                                1),
                          ],
                        ),
                        //  "Jan/30, Mon"
                        Row(
                          children: [
                            tankerDetailField(
                                "Visitor Type",
                                data.pass!.passVisitorRelation!.name.toString(),
                                1),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CancelButton(
                              title: "Share",
                              func: () async {
                                // RepaintBoundary(
                                //   key: _globalKey,
                                //   child: PassScreen(),
                                // );

                                
                                // passImage.capture().then((value) async {
                                //   if (value != null) {
                                //     try {
                                //       print("Captured image");
                                //       // Share the captured image using Share.shareXFiles
                                //       await Share.shareXFiles(
                                //           [XFile.fromData(value)],
                                //           text: 'Check out this image!');
                                //     } catch (e) {
                                //       print("Error sharing image: $e");
                                //     }
                                //   } else {
                                //     print("Image capture failed");
                                //   }
                                // });
                                // passImage.capture().then((value)async{
                                //   print("<<<<<<<<<<<<<<$value>>>>>>>>>>>>>>");
                                //   print("<<<<<<<<<<<<<<${value.runtimeType}>>>>>>>>>>>>>>");
                                //   // Share.shareXFiles(value);
                                // await  Share.shareXFiles([XFile.fromData(value!)]);
                                // });
                                // navigate(context, PassScreen());
                              },
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            PrimaryButton(
                              title: "Copy",
                              func: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
