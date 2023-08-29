import 'package:beam_tv_1/resources/components/notification_tile.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/components/header_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerWidget(context, 8, "Notification", false, true),
            Container(
                padding: EdgeInsets.only(left: 20.h, right: 20.h),
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NotificationTile(
                      leading: tankerBlueYellow,
                      title: "Tanker",
                      date: "05/21/2020",
                      subtitle:
                          "You can specify the desired action or code to execute in the corresponding callback functions for each gesture. For example, you can perform navigation, update the UI, or trigger other actions based on the detected gestures.",
                    ),
                    NotificationTile(
                      leading: adminorange,
                      title: "Tanker",
                      date: "05/21/2020",
                      subtitle:
                          "You can specify the desired action or code to execute in the corresponding callback functions for each gesture. For example, you can perform navigation, update the UI, or trigger other actions based on the detected gestures.",
                    ),
                    NotificationTile(
                      leading: tankerBlueYellow,
                      title: "Tanker",
                      date: "05/21/2020",
                      subtitle:
                          "You can specify the desired action or code to execute in the corresponding callback functions for each gesture. For example, you can perform navigation, update the UI, or trigger other actions based on the detected gestures.",
                    ),
                    NotificationTile(
                      leading: tankerBlueYellow,
                      title: "Tanker",
                      date: "05/21/2020",
                      subtitle:
                          "You can specify the desired action or code to execute in the corresponding callback functions for each gesture. For example, you can perform navigation, update the UI, or trigger other actions based on the detected gestures.",
                    ),
                    NotificationTile(
                      leading: tankerBlueYellow,
                      title: "Tanker",
                      date: "05/21/2020",
                      subtitle:
                          "You can specify the desired action or code to execute in the corresponding callback functions for each gesture. For example, you can perform navigation, update the UI, or trigger other actions based on the detected gestures.",
                    ),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
