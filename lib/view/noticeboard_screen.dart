import 'package:CommunityApp/ViewModel/noticeboard_view_model.dart';
import 'package:CommunityApp/resources/color.dart';
import 'package:CommunityApp/resources/components/content.dart';
import 'package:CommunityApp/resources/components/header_widget.dart';
import 'package:CommunityApp/resources/components/loading.dart';
import 'package:CommunityApp/resources/components/noticeboard_heading_tile.dart';
import 'package:CommunityApp/resources/components/noticeboard_tile.dart';
import 'package:CommunityApp/resources/image.dart';
import 'package:CommunityApp/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Model/noticeboard_data_model/noticeboard_data_model.dart';
import '../data/response/status.dart';

class NoticeboardScreen extends StatefulWidget {
  const NoticeboardScreen({super.key});

  @override
  State<NoticeboardScreen> createState() => _NoticeboardScreenState();
}

class _NoticeboardScreenState extends State<NoticeboardScreen> {
  NoticeboardViewModel noticeboardViewModel = NoticeboardViewModel();
  bool show = true;

  @override
  void initState() {
    noticeboardViewModel.fetchNoticeboardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          headerWidget(context, 8, "Notice Board", false, true),
          ChangeNotifierProvider<NoticeboardViewModel>(
            create: (BuildContext context) => noticeboardViewModel,
            child: Consumer<NoticeboardViewModel>(
                builder: (context, value, child) {
              switch (value.noticeboardList.status) {
                case Status.INIT:
                  return Container();
                case Status.LOADING:
                  return Loading();
                case Status.ERROR:
                  return Center(
                    child: Content(
                        data: value.noticeboardList.message.toString(),
                        size: 18),
                  );
                case Status.COMPLETED:
                  var noticeBoardData = value.noticeboardList.data!.data;
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 60.h),
                              decoration: BoxDecoration(
                                  color: red,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: lightblue2,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: lightblue,
                                              borderRadius:
                                                  BorderRadius.circular(20.r)),
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    NoticeboardHeadingTile(),
                                                    Builder(builder: (context) {
                                                      var v = value
                                                          .getNotice("meeting");
                                                      if (v != null) {
                                                        return NoticeboardTile(
                                                            title: v.title
                                                                .toString(),
                                                            content: v.content
                                                                .toString(),
                                                            textColor:
                                                                Colors.white,
                                                            date: Utils
                                                                .dateFormat1(v
                                                                    .date
                                                                    .toString()),
                                                            vector: chat);
                                                      }
                                                      return Container();
                                                    })
                                                    // NoticeboardTile(
                                                    //     // title: value.noticeboardList.data![index].content.toString(),
                                                    //     title: noticeBoardData!
                                                    //         .first.title
                                                    //         .toString(),
                                                    //     // iteration: value.noticeboardList.data!.,
                                                    //     content: noticeBoardData
                                                    //         .first.content
                                                    //         .toString(),
                                                    //     textColor: Colors.white,
                                                    //     date: noticeBoardData
                                                    //         .first.date
                                                    //         .toString(),
                                                    //     vector: chat)
                                                  ],
                                                ),
                                              ),
                                              Builder(builder: (context) {
                                                var v = value
                                                    .getNotice("maintenance");
                                                if (v != null) {
                                                  return NoticeboardTile(
                                                      title: v.title.toString(),
                                                      content:
                                                          v.content.toString(),
                                                      textColor: Colors.black,
                                                      date: Utils.dateFormat1(
                                                          v.date.toString()),
                                                      vector: maintenance);
                                                }
                                                return Container();
                                              })
                                            ],
                                          ),
                                        ),
                                        Builder(builder: (context) {
                                          var v = value.getNotice("opening");
                                          if (v != null) {
                                            return NoticeboardTile(
                                                title: v.title.toString(),
                                                content: v.content.toString(),
                                                textColor: Colors.black,
                                                date: Utils.dateFormat1(
                                                    v.date.toString()),
                                                vector: opening);
                                          }
                                          return Container();
                                        })
                                        // NoticeboardTile(
                                        //     title: "Opening",
                                        //     content:
                                        //         "Integer at faucibus urna. Nullam condimentum leo id elit sagittis auctor.Curabitur elementum nunc a leo imperdiet, nec elementum diam elementum.Etiam elementum euismod commodo.",
                                        //     textColor: Colors.black,
                                        //     date: "20/03/2023",
                                        //     vector: opening)
                                      ],
                                    ),
                                  ),
                                  Builder(builder: (context) {
                                    var v = value.getNotice("closing");
                                    if (v != null) {
                                      return NoticeboardTile(
                                          title: v.title.toString(),
                                          content: v.content.toString(),
                                          textColor: Colors.white,
                                          date: Utils.dateFormat1(
                                              v.date.toString()),
                                          vector: closing);
                                    }
                                    return Container();
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                case null:
              }
              return Container();
            }),
          ),
        ],
      )),
    );
  }
}
