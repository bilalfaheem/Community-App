import 'package:CommunityApp/ViewModel/tanker_view_model.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/tanker_alert_tile.dart';
import 'package:CommunityApp/resources/components/tanker_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TankerHistory extends StatelessWidget {
  //  const TankerHistory({super.key});
  const TankerHistory({super.key, required this.data});
  final TankerViewModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 380, //change to layout
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
      decoration: const BoxDecoration(
          color: greyLightBg,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "  Tanker History",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 13.h,
          ),
          // Container(
          //   height: 300,
          //   child: Expanded(
          // child:
          Expanded(
            child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data
                    .tankerList.data!.data!.tankerHistory!.historyData!.length,
                itemBuilder: (context, index) {
                  // print(size.height - 598.h);
                  final iteration = data.tankerList.data!.data!.tankerHistory!
                      .historyData![index];
                  return TankerTile(
                    value: iteration,
                  );
                }),
          ),
          //   ),
          // )
        ],
      ),
    );
  }
}
