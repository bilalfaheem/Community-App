import 'package:beam_tv_1/ViewModel/billing_view_model.dart';
import 'package:beam_tv_1/data/response/status.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:beam_tv_1/resources/components/my_billing.dart';
import 'package:beam_tv_1/resources/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Model/billing_data_model2/billing_data_model.dart';

class TankerBillingScreen extends StatefulWidget {
  const TankerBillingScreen({super.key});

  @override
  State<TankerBillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<TankerBillingScreen> {
  BillingViewModel2 billingViewModel = BillingViewModel2();

  @override
  void initState() {
    billingViewModel.fetchBillingList();
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
              ChangeNotifierProvider<BillingViewModel2>(
                create: (BuildContext context) => billingViewModel,
                child: Consumer<BillingViewModel2>(
                    builder: (context, value, child) {
                  switch (value.billingList.status) {
                    case Status.INIT:
                      return Container();
                    case Status.LOADING:
                      return Loading();
                    case Status.ERROR:
                      return Center(
                        child: Content(
                            data: value.billingList.message.toString(),
                            size: 18),
                      );
                    case Status.COMPLETED:
                      final BillingDataModel2? billingListData =
                          value.billingList.data;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: size.safeAreaHeight,
                        child: LayoutBuilder(
                            builder: (context, BoxConstraints constraints) {
                          final double availableHeight = constraints.maxHeight;
                          return Column(
                            children: [
                              SizedBox(
                                height: availableHeight * 0.44,
                                child: Column(
                                  children: [
                                    headerWidget(
                                        context, 8, "My Billing", false, true),
                                    MyBilling(),
                                    // MyBillingDate(   /// remove A
                                    //     paid: billingListData!
                                    //                 .data!.dueDate!.userStatus
                                    //                 .toString() ==
                                    //             "0"
                                    //         ? false
                                    //         : true,
                                    //     billData: billingListData.data!.bill,
                                    //     dueData: billingListData.data!.dueDate),
                                    // SizedBox(
                                    //   height: 20.h,
                                    // ),
                                    // Text("data")
                                  ],
                                ),
                              ),
                              // SizedBox(height: 12,),
                              //     GestureDetector(
                              //       onTap: () {
                              //   // print("object");
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (_) => WaterBilling()));
                              // },
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.start,
                              //         children: [
                              //           Content(data: "Water Billing ", size: 18.sp, weight: FontWeight.bold,),
                              //         ],
                              //       ),
                              //     ),
                              // SizedBox(height: 12,),

                              SizedBox(
                                height: 12,
                              ),

                              // Expanded(   // remove A
                              //   child: SizedBox(
                              //     height: availableHeight * 0.5,
                              //     child: MyBillingHistory(
                              //         history: billingListData
                              //             .data?.maintenanceHistory),
                              //   ),
                              // ),
                            ],
                          );
                        }),
                      );
                    case null:
                  }
                  return Container();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
