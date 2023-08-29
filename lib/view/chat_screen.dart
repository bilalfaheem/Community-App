import 'dart:async';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/chat_bubble.dart';
import 'package:beam_tv_1/resources/components/chat_header.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  String to_user, title;
  ChatScreen({required this.to_user, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool timerStatus = true;
  String hasData = "waiting";
  late StreamController chatStreamController;
  TextEditingController msgController = TextEditingController();

  // loadChat() async {
  //   getChat(widget.to_user.toString()).then((res) async {
  //     chatStreamController.add(res);
  //     return res;
  //   });
  // }

  // Future<Null> refreshChat() async {
  //   // print("<<<<<<<<<<<<<<<<<<<<handle Refresh>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  //   getChat(widget.to_user.toString()).then((res) async {
  //     chatStreamController.add(res);
  //     return null;
  //   });
  // }

  // sendmessage() async {
  //   if (msgController.text.isNotEmpty) {
  //     hasData = "sending";
  //     final send = await sendMsg(
  //         // chatThreadId,
  //         widget.to_user.toString(),
  //         msgController.text);
  //     // print("<<<<<<<<<<<<<<<<<<<<<<$send>>>>>>>>>>>>>>>>>>>>>>");
  //     if (send == true) {
  //       msgController.clear();
  //       hasData = "hasData";
  //       refreshChat();
  //     } else {
  //       hasData = "hasData";
  //     }
  //   }
  // }

  // reload() {
  //   Timer.periodic(Duration(seconds: 6), (timer) {
  //     // print(hasData);
  //     switch (hasData) {
  //       case "hasData":
  //         refreshChat();
  //         break;
  //       case "sending":
  //         break;
  //       case "waiting":
  //         break;
  //       case "close":
  //         timer.cancel();
  //         break;
  //     }
  //   });
  // }

  // reload1()async {
  //   while (timerStatus== true) {
  //     print(
  //         "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<while>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  //     await refreshChat();
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // chatThreadId = "null";
  //   chatStreamController = StreamController();
  //   loadChat();
  //   msgController = TextEditingController();
  //   reload();
  // }

  // @override
  // void dispose() {
  //   // timerStatus = false;
  //   hasData = "close";
  //   chatStreamController.onCancel;
  //   chatStreamController.done;
  //   chatStreamController.close();
  //   msgController.dispose();
  //   // loadChat().dispose();
  //   // chatThreadId = "null";
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              // margin: EdgeInsets.only(top: size.height * 0.045),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                headerWidget(context, 8, "Complaint Chat", false, true),
                // Container(
                //   // margin: EdgeInsets.only(bottom: 20),
                //   color: primaryColor,
                //   child: chatHeader(context, widget.title),
                // ),
                chatBubble(size, "user", "Hi", "2023-05-10 11:35:30"),
                chatBubble(size, "admin", "Hi", "2023-05-10 11:35:30"),
                chatBubble(size, "admin", "Hello", "2023-05-10 11:35:30"),
                // >>>>>>>>>>>>>>>>>>>>>>>>>>> All Bids <<<<<<<<<<<<<<<<<<<<<
                // Expanded(
                //   child: Container(
                //     height: size.height * 0.2,
                //     child: SingleChildScrollView(
                //       reverse: true,
                //       child: StreamBuilder(
                //         stream: chatStreamController.stream,
                //         builder: (BuildContext context, AsyncSnapshot snapshot) {
                //           // print('Has error: ${snapshot.hasError}');
                //           // print('Has data: ${snapshot.hasData}');
                //           // print('Snapshot Data ${snapshot.data}');
                //           if (snapshot.hasError) {
                //             return Text(snapshot.error.toString());
                //           }
                //           if (snapshot.hasData) {
                //             hasData = "hasData";
                //             return Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   ListView.builder(
                //                       physics: NeverScrollableScrollPhysics(),
                //                       padding: EdgeInsets.zero,
                //                       shrinkWrap: true,
                //                       itemCount: chatList.length,
                //                       itemBuilder: (context, index) {
                //                         return chatBubble(
                //                             size,
                //                             chatList[index].userId.toString() ==
                //                                     auctionHugagId
                //                                 ? "user"
                //                                 : "admin",
                //                             chatList[index].message.toString(),
                //                             chatList[index].createdAt);
                //                       }),
                //                   SizedBox(
                //                     height: 73,
                //                   )
                //                 ]);
                //           }
                //           if (snapshot.connectionState ==
                //               ConnectionState.waiting) {
                //             return Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   // SizedBox(
                //                   //   height: 150,
                //                   // ),
                //                   Center(
                //                       child: CircularProgressIndicator(
                //                     strokeWidth: 1.5,
                //                     color: primaryColor,
                //                   )),
                //                   SizedBox(
                //                     height: 500,
                //                   )
                //                 ]);
                //           } else if (!snapshot.hasData &&
                //               snapshot.connectionState == ConnectionState.done) {
                //             return Center(child: Text("No Msg"));
                //           } else {
                //             return Container();
                //           }
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // chatBubble(size, "admin", "text"),
                // chatBubble(size, "user", text),
              ]),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.h),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r))),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 8.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Image.asset(
                          link,
                          height: 22.h,
                        )),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: TextField(
                          controller: msgController,
                          minLines: 1,
                          maxLines: 4,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                          decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "Type...",
                              hintStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 12.h)),
                        ),
                      ),
                    ),
                    // Container(
                    //     margin: EdgeInsets.symmetric(horizontal: 5),
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    //     decoration: BoxDecoration(
                    //         color: Colors.white.withOpacity(0.12),
                    //         borderRadius: BorderRadius.circular(11)),
                    //     child: Image.asset(
                    //       camera,
                    //       height: 22,
                    //     )),
                    GestureDetector(
                      onTap: () {
                        // sendmessage();
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 8.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.h, vertical: 10.h),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Image.asset(
                            send,
                            height: 22.h,
                            color: orange,
                          )),
                    ),
                  ],
                ),
              )
              // msgField(size, msgController, "3", "func")
              //  chatTile(size, "passive")
            ])
          ],
        ),
      ),
    );
  }
}
