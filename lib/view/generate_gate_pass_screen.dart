import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/Model/event.dart';
import 'package:beam_tv_1/Model/gate_pass_data_model/event_list.dart';
import 'package:beam_tv_1/Model/user_contact_list_data_model/user_contact_list.dart';
import 'package:beam_tv_1/ViewModel/generate_pass_alert_view_model.dart';
import 'package:beam_tv_1/ViewModel/generate_pass_view_model.dart';
import 'package:beam_tv_1/resources/components/contact_tile.dart';
import 'package:beam_tv_1/resources/components/duration_alert.dart';
import 'package:beam_tv_1/resources/components/event_type_alert.dart';
import 'package:beam_tv_1/resources/components/generate_gate_pass_tile.dart';
import 'package:beam_tv_1/resources/components/pass_type_alert.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:beam_tv_1/resources/color.dart';
import 'package:beam_tv_1/resources/components/visitor_type_alert.dart';
import 'package:beam_tv_1/resources/image.dart';
import 'package:beam_tv_1/resources/components/add_contact_alert.dart';
import 'package:beam_tv_1/view/pass_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Model/gate_pass_data_model/type_list.dart';
import '../Model/gate_pass_data_model/validity_list.dart';
import '../Model/gate_pass_data_model/visitor_list.dart';

List typeList = ["One Time", "Recurring"];
List durationList = ["3 Hours", "6 Hours", "9 Hours", "12 Hours"];
List visitorTypeList = ["Family/ Friends", "Delivery/Vendor"];

class GenerateGatePassScreen extends StatefulWidget {
  final EventList eventList;
  final TypeList typeList;
  final VisitorList visitorList;
  final ValidityList validityList;

  GenerateGatePassScreen(
      {super.key,
      required this.typeList,
      required this.visitorList,
      required this.validityList,
      required this.eventList,
       });

  @override
  State<GenerateGatePassScreen> createState() => _GenerateGatePassScreenState();
}

class _GenerateGatePassScreenState extends State<GenerateGatePassScreen> {
  // void eventAlert() async {
  //   // List eventList = ["BreakFast", "Lunch", "Dinner"];
  //   // for (final i in eventList) {
  //   //   print(i);
  //   //   eventMap.add(Event(title: i));
  //   // }
  //   print(eventMap[0].title);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // eventAlert();
    final generatePassViewModel =
        Provider.of<GeneratePassViewModel>(context, listen: false);
    generatePassViewModel.initialize();
      GeneratePassAlertViewModel generatePassAlertViewModel =
          Provider.of<GeneratePassAlertViewModel>(context, listen: false);
          generatePassAlertViewModel.fetchUserContactListResponse(context);
  }

  @override
  Widget build(BuildContext context) {
    final generatePassViewModel =
        Provider.of<GeneratePassViewModel>(context, listen: false);

         GeneratePassAlertViewModel generatePassAlertViewModel =
          Provider.of<GeneratePassAlertViewModel>(context, listen: false);
    // generatePassViewModel.initialize();

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          headerWidget(context, 8, "Generate Gate Pass", false, true),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            padding: EdgeInsets.only(top: 18.h, bottom: 30.h),
            decoration: BoxDecoration(
                color: greyLightBg, borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      generateQr,
                      height: 207.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Consumer<GeneratePassViewModel>(
                    builder: (context, value, child) {
                  return Column(
                    children: [
                      Visibility(
                        visible: !value.contactField,
                        child: Column(
                          children: [
                            Image.asset(
                              progressBar21,
                              width: 86.w,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Consumer<GeneratePassAlertViewModel>(
                              builder: (context,value,child) {
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            eventTypeAlert(context,widget.eventList);
                                          },
                                          child: generateGatePassTile(
                                            "Event",
                                            value.selectedEventIndex == -1?
                                            "Select Tile":widget.eventList.eventData![value.selectedEventIndex].name.toString(),
                                            value.selectedEventIndex == -1?false:true 
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            passTypeAlert(context,widget.typeList);
                                          },
                                          child: generateGatePassTile(
                                              "Pass Type", value.selectedPassTypeIndex == -1?
                                            "Select Tile":widget.typeList.passListData![value.selectedPassTypeIndex].name.toString(),
                                            value.selectedPassTypeIndex == -1?false:true )),
                                      GestureDetector(
                                          onTap: () {
                                            durationAlert(context,widget.validityList);
                                          },
                                          child: generateGatePassTile(
                                              "Duration", value.selectedDurantionIndex == -1?
                                               "Select Duration":widget.validityList.validityData![value.selectedDurantionIndex].hours.toString(),
                                            value.selectedDurantionIndex == -1?false:true,)),
                                      GestureDetector(
                                          onTap: () {
                                            visitorTypeAlert(context,widget.visitorList);
                                          },
                                          child: generateGatePassTile(
                                              "Visitor Type", value.selectedVisitorIndex == -1?
                                              
                                               "Select Visitor":widget.visitorList.visitorData![value.selectedVisitorIndex].name.toString(),
                                            value.selectedVisitorIndex == -1?false:true,)),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          PrimaryButton(
                                            title: "NEXT",
                                            loading: generatePassAlertViewModel.userContactloading,
                                            func: () {
                                              generatePassViewModel.setStep(true);
                                            },
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: value.contactField,
                          child: Column(
                            children: [
                              Image.asset(
                                progressBar22,
                                width: 86.w,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 20.w),
                                      child: Text(
                                        "Contact:",
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Row(
                                    children: [
                                      Container(
                                        height: 40.h,
                                        width: 40.h,
                                        margin: EdgeInsets.only(right: 7.w),
                                        padding: EdgeInsets.all(7.h),
                                        decoration: BoxDecoration(
                                            color: Color(0xffE9E9E9),
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: Image.asset(
                                          delete,
                                          color: primaryColor,
                                          height: 30.h,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          addContactAlert(context);
                                        },
                                        child: Container(
                                          height: 40.h,
                                          width: 40.h,
                                          padding: EdgeInsets.all(10.h),
                                          decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: Image.asset(add,
                                              color: Colors.white,
                                              height: 10.h),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Consumer<GeneratePassAlertViewModel>(
                                builder: (context,value,child){
                                  return Container(
                                  margin: EdgeInsets.only(top: 10.h),
                                  height: 300.h,
                                  child: Scrollbar(
                                    isAlwaysShown: true,
                                    // showTrackOnHover: true,
                                    // thickness: 3,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: ListView.builder(
                                          itemCount: value.userContactList.data!.userContactList?.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            final iteration = value.userContactList.data!.userContactList?[index];
                                            return ContactTile(
                                                title: iteration!.contactName.toString(),
                                                contact: iteration.contactPhone.toString());
                                          }),
                                    ),
                                  ),
                                );

                                }
                                
                              ),
                              Container(
                                margin:
                                    EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        generatePassViewModel.setStep(false);
                                      },
                                      child: Image.asset(
                                        back,
                                        width: 33.w,
                                      ),
                                    ),
                                    PrimaryButton(
                                      title: "Generate",
                                      func: () {
                                        navigate(context, PassDetailScreen());
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  );
                })
              ],
            ),
          ),
        ],
      )),
    );
  }
}
