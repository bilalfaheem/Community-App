import 'package:beam_tv_1/Model/gate_pass_data_model/active_pass.dart';
import 'package:beam_tv_1/Model/gate_pass_data_model/scanned_pass.dart';
import 'package:beam_tv_1/Provider/gatepass_provider.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/gate_pass_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GatePassHistory extends StatelessWidget {
  final ActivePass activePassesList;
  final ScannedPass scannedPassesList;
  GatePassHistory(
      {super.key,
      required this.activePassesList,
      required this.scannedPassesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.58.sh,
      margin: EdgeInsets.all(10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
      decoration: BoxDecoration(
          color: greyLightBg, borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        children: [
          Consumer<GatePassProvider>(builder: (context, value, child) {
            return Container(
              margin: EdgeInsets.only(bottom: 30.h),
              decoration: BoxDecoration(
                  // color: primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      value.toggleFunc(true);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: value.active ? primaryColor : null,
                      ),
                      child: Text(
                        "Active Passes",
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: value.active ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      value.toggleFunc(false);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: value.active ? null : primaryColor,
                      ),
                      child: Text(
                        "Scanned Passes",
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: value.active ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
          Expanded(
            child: Consumer<GatePassProvider>(builder: (context, value, child) {
              return value.active
                  ? activePassesList.activePassData!.length == 0
                      ? Center(
                          child: Content(data: "No Active Passes", size: 18.sp))
                      : ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: activePassesList.activePassData!.length,
                          itemBuilder: (context, index) {
                            final iteration =
                                activePassesList.activePassData![index];
                            return GatePassTile(
                                active: true,
                                title: iteration.addressId.toString());
                          })
                  : scannedPassesList.scanPassData!.length == 0
                      ? Center(
                          child:
                              Content(data: "No Scanned Passes", size: 18.sp))
                      : Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: ListView.separated(
                              // physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              shrinkWrap: true,
                              itemCount: scannedPassesList.scanPassData!.length,
                              itemBuilder: (context, index) {
                                final iteration =
                                    scannedPassesList.scanPassData![index];
                                return GatePassTile(
                                    active: false,
                                    title: iteration.contactName.toString());
                              }),
                        );
              // GatePassTile(active: true, title: "title")
              // : GatePassTile(active: false, title: "title");
            }),
          )
        ],
      ),
    );
  }
}
