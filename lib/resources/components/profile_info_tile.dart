import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color.dart';
import '../image.dart';
import 'content.dart';

class ProfileInfoTile extends StatelessWidget {
  const ProfileInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 35.h,
      ),
      padding: EdgeInsets.all(15.h),
      // height: 45.h,
      // width: 65.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(55.r)),
          color: greyLightBg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: orange),
                padding: EdgeInsets.all(2),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: orange,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    profileImage,
                    fit: BoxFit.fitWidth,
                    height: 70.h,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daniyal Khan",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Content(
                      data: "Z-204",
                      size: 18.sp,
                      color: greyTextLight,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            // width: 120.w,
            // height: 40.h,
            decoration: BoxDecoration(
              color: orange,
              borderRadius: BorderRadius.all(Radius.circular(21.r)),
            ),
            // color: Colors.amber,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10.w, 7.w, 10.w, 9.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        addphoto,
                        height: 23.h,
                      ),
                      Text("Edit Photo",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
