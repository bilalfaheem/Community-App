import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/home_card.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:beam_tv_1/view/complaint_screen.dart';
import 'package:beam_tv_1/view/noticeboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        navigate(context, NoticeboardScreen());
                      },
                      child: homeCard(alert, "Notice Board", orangeGradient))),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        // navigate(context, ComplaintScreen());
                        Utils.snackBar(
                            "Not Subscribe to Complaint Module", context);
                      },
                      child: homeCard(chat, "Complaint", blueDarkGradient)))
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                           Utils.snackBar(
                            "Not Subscribe to Services Module", context);
                    },
                    child: homeCard(services, "Services", blueLightGradient))),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                           Utils.snackBar(
                            "Not Subscribe to Book Amenities Module", context);
                    },
                    child: homeCard(
                        calenderVector, "Book\nAmenities", greenGradient),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
