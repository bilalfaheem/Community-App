import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color.dart';
import 'content.dart';

class ContactUsTile extends StatelessWidget {
  final String Title;
  const ContactUsTile({
    super.key,
    required this.Title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 12.h,
        horizontalTitleGap: 4.h,
        minLeadingWidth: 5.h,
        leading: Container(
          height: 6.h,
          width: 12.h,
          decoration: BoxDecoration(shape: BoxShape.circle, color: orange),
        ),
        title: Content(
          data: Title,
          size: 17.sp,
          // maxLines: 100,
        ),
      ),
    );
  }
}
