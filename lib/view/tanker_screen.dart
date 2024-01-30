import 'package:CommunityApp/Model/tanker_data_model/tanker_data_model.dart';
import 'package:CommunityApp/ViewModel/tanker_view_model.dart';
import 'package:CommunityApp/data/response/status.dart';
import 'package:CommunityApp/resources/components/active_tanker.dart';
import 'package:CommunityApp/resources/components/content.dart';
import 'package:CommunityApp/resources/components/header_widget.dart';
import 'package:CommunityApp/resources/components/loading.dart';
import 'package:CommunityApp/resources/components/request_tanker.dart';
import 'package:CommunityApp/resources/components/tanker_history.dart';
import 'package:CommunityApp/resources/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TankerScreen extends StatefulWidget {
  const TankerScreen({super.key});

  @override
  State<TankerScreen> createState() => _TankerScreenState();
}

class _TankerScreenState extends State<TankerScreen> {
  TankerViewModel tankerViewModel = TankerViewModel();

  @override
  void initState() {
    tankerViewModel.fetchTankerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // headerWidget(context, 8, "My Order", false, false),
              ChangeNotifierProvider<TankerViewModel>(
                create: (BuildContext context) => tankerViewModel,
                child:
                    Consumer<TankerViewModel>(builder: (context, value, child) {
                  switch (value.tankerList.status) {
                    case Status.INIT:
                      return Container();
                    case Status.LOADING:
                      return Loading();
                    case Status.ERROR:
                      return Center(
                        child: Content(
                            data: value.tankerList.message.toString(),
                            size: 18),
                      );
                    case Status.COMPLETED:
                      final TankerDataModel? tankerList = value.tankerList.data;
                      // return Container();
                      return Container(
                        // color: Colors.amber,
                        height: size.safeAreaHeight,
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          final double availableHeight = constraints.maxHeight;
                          print("${size.safeAreaHeight} size padding");
                          return Column(
                            children: [
                              SizedBox(
                                // height: availableHeight * 0.51,
                                // heightFactor: 0.3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    headerWidget(
                                        context, 8, "My Order", false, false),
                                    value.tankerList.data!.data!.active!
                                                .activeData!.length ==
                                            0
                                        ? Container()
                                        :
                                        // Container(),
                                        ActiveTanker(
                                            value: value
                                                .tankerList.data!.data!.active),
                                    RequestTanker(
                                        tankerLeft: value
                                            .tankerList
                                            .data!
                                            .data!
                                            .tankerLeft!
                                            .first
                                            .leftData!
                                            .first
                                            .tankerLeft
                                            .toString()),
                                  ],
                                ),
                              ),
                              // Content(
                              //     data: value.tankerList.data!.message.toString(),
                              //     size: 10),
                              // TankerHistory(data: value,),
                              SizedBox(
                                  height: value.tankerList.data!.data!.active!
                                              .activeData!.length ==
                                          0
                                      ? availableHeight * 0.72
                                      : availableHeight * 0.48,
                                  child: TankerHistory(data: value)),
                              // Container(
                              //   height: 600,
                              //   child: Container(
                              //       //  height: 30,
                              //       margin: EdgeInsets.symmetric(horizontal: 10.w),
                              //       padding:
                              //           EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
                              //       decoration:const BoxDecoration(
                              //           color: greyLightBg,
                              //           borderRadius: BorderRadius.only(
                              //               topLeft: Radius.circular(20),
                              //               topRight: Radius.circular(20))),
                              //       child: Column(
                              //         crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: [
                              //           Text(
                              //             "  Tanker History",
                              //             style: TextStyle(
                              //                 fontSize: 20.sp, fontWeight: FontWeight.bold),
                              //           ),
                              //           SizedBox(
                              //             height: 13.h,
                              //           ),
                              //           Expanded(
                              //             child: Container(
                              //               // height: 3,
                              //               // height: size.height - 550.h,
                              //               // height:size.height - 537.h,
                              //               child: ListView.builder(
                              //                   // physics: NeverScrollableScrollPhysics(),
                              //                   shrinkWrap: true,
                              //                   itemCount: 100,
                              //                   itemBuilder: (context, index) {
                              //                     // print(size.height - 598.h);
                              //                     return TankerTile(value: HistoryDatum(
                              //                         id: 218,
                              //                         createdAt: DateTime(455),
                              //                         toUserRelation: ToUserRelation(),
                              //                         deliveryAt: "sdssad",

                              //                     ),);
                              //                   }),
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              // )
                            ],
                          );
                        }),
                      );
                    case null:
                  }
                  return Container();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
