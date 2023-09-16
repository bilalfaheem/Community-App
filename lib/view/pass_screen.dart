import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/components/pass_tile.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';
import 'package:beam_tv_1/Model/generate_pass_data_model/data.dart';
import '../resources/utils.dart';

GlobalKey _globalKey = GlobalKey();

class PassScreen extends StatelessWidget {
  Data data;
  PassScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            headerWidget(context, 8, "Gate Pass", false, true),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      RepaintBoundary(
                        key: _globalKey,
                        child: Stack(
                          clipBehavior: Clip.hardEdge,
                          children: [
                            Image.asset(
                              pass,
                              height: 700.h,
                              width: 390.w,
                            ),
                            Positioned(
                                width: 395.w,
                                top: 125.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    PrettyQr(
                                      size: 130.h,
                                      data: data.pass!.userRelation!.qrCode.toString(),
                                      roundEdges: true,
                                    )
                                  ],
                                )),
                            Positioned(
                                top: 320.h,
                                width: 395.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      // height: 200,
                                      width: 395.w,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              passTile(
                                                  "Name:", data.passUser!.userContactRelation!.contactName
                                    .toString(), 18),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              passTile(
                                                  "Pass Type:",  data.pass!.passTypeRelation!.name.toString(), 18),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              passTile("Event",   data.pass!.passEventRelation!.name.toString(), 18)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              passTile("Address",  LocalData.address, 18)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              passTile("Expiry:",
                                                       Utils.dateTimeFormat(
                                    data.pass!.endDate.toString()), 16)
                                            ],
                                          )
                                          //
                                          // passTile("Event:", "Dinner"),
                                          // passTile("Address:", "Z-204"),
                                          // passTile("Expiry:", "Jan 30, Mon | 7:32pm"),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 20,
                        child: GestureDetector(
                          onTap: () async {
                            var b = await Utils()
                                .captureWidgetToUnit8list(_globalKey);
                            print(b);
                            var imgFile = await Utils().uint8ListToXFile(b);
                            Share.shareXFiles([imgFile]);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.65),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.share,
                              color: orange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
