import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/components/noticeboard_heading_tile.dart';
import 'package:beam_tv_1/resources/components/noticeboard_tile.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeboardScreen extends StatelessWidget {
  NoticeboardScreen({super.key});
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            headerWidget(context, 8, "Notice Board", false, true),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 60.h),
                    decoration: BoxDecoration(
                        color: red, borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: lightblue2,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: lightblue,
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          NoticeboardHeadingTile(),
                                          NoticeboardTile(
                                              title: "Meeting",
                                              content:
                                                  "Integer at faucibus urna. Nullam condimentum leo id elit sagittis auctor.Curabitur elementum nunc a leo imperdiet, nec elementum diam elementum.Etiam elementum euismod commodo.",
                                              textColor: Colors.white,
                                              date: "20/03/2023",
                                              vector: chat)
                                        ],
                                      ),
                                    ),
                                    NoticeboardTile(
                                        title: "Maintenance",
                                        content:
                                            "Integer at faucibus urna. Nullam condimentum leo id elit sagittis auctor.Curabitur elementum nunc a leo imperdiet, nec elementum diam elementum.Etiam elementum euismod commodo.",
                                        textColor: Colors.black,
                                        date: "20/03/2023",
                                        vector: maintenance)
                                  ],
                                ),
                              ),
                              NoticeboardTile(
                                  title: "Opening",
                                  content:
                                      "Integer at faucibus urna. Nullam condimentum leo id elit sagittis auctor.Curabitur elementum nunc a leo imperdiet, nec elementum diam elementum.Etiam elementum euismod commodo.",
                                  textColor: Colors.black,
                                  date: "20/03/2023",
                                  vector: opening)
                            ],
                          ),
                        ),
                        NoticeboardTile(
                            title: "Closing",
                            content:
                                "Integer at faucibus urna. Nullam condimentum leo id elit sagittis auctor.Curabitur elementum nunc a leo imperdiet, nec elementum diam elementum.Etiam elementum euismod commodo.",
                            textColor: Colors.white,
                            date: "20/03/2023",
                            vector: closing)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
