import 'package:CommunityApp/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactTile extends StatelessWidget {
  String title;
  String contact;
  Color tileColor;
  ContactTile(
      {required this.title, required this.contact, required this.tileColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
      decoration: BoxDecoration(
          color: tileColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            contact,
            style: TextStyle(
                fontSize: 18.sp,
                color: greyTextLight,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
