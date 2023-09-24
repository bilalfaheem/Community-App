import 'package:beam_tv_1/ViewModel/notification_view_model.dart';
import 'package:beam_tv_1/data/response/status.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:beam_tv_1/resources/components/notification_tile.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../resources/components/header_widget.dart';

//  padding: EdgeInsets.only(left: 20.h, right: 20.h),
//         margin: EdgeInsets.only(top: 20.h, bottom: 20.h),

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationViewModel notificationViewModel = NotificationViewModel();

  @override
  void initState() {
    notificationViewModel.fetchNotificationList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          headerWidget(context, 8, "Notification", false, true),
          ChangeNotifierProvider<NotificationViewModel>(
              create: (BuildContext context) => notificationViewModel,
              child: Consumer<NotificationViewModel>(
                  builder: (context, value, child) {
                switch (value.notificationList.status) {
                  case Status.LOADING:
                    return SizedBox(
                      height: 0.7.sh,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Loading(),
                        ],
                      ),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Content(
                          data: value.notificationList.message.toString(),
                          size: 18),
                    );
                  case Status.COMPLETED:
                    var noticeBoardData =
                        value.notificationList.data!.notificationData;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 15.h),
                        child: ListView.separated(
                            itemCount: noticeBoardData!.length,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemBuilder: (context, index) {
                              final iteration = noticeBoardData[index];
                              return NotificationTile(iteraion: iteration);
                            }),
                      ),
                    );
                }
                return Container();
              }))
        ]),
      ),
    );
  }
}
