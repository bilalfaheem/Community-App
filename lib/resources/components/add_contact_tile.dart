import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'content_field.dart';

class AddContactTile extends StatelessWidget {
  String hint;
  AddContactTile({
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.h),
        child: Center(
            child: ContentField(
          hint: hint,
          controller: TextEditingController(),
          inputFormat: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
        )));
  }
}
