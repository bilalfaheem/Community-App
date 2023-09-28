import 'package:beam_tv_1/Model/billing_data_model/billing_data_model.dart';
import 'package:beam_tv_1/ViewModel/billing_view_model.dart';
import 'package:beam_tv_1/data/response/status.dart';
import 'package:beam_tv_1/resources/components/content.dart';
import 'package:beam_tv_1/resources/components/loading.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/resources/sizeconfig.dart';
import 'package:beam_tv_1/view/water_billing_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../resources/color.dart';
import '../resources/components/my_billing_status2.dart';
import '../resources/components/water_billing_status.dart';
import '../resources/image.dart';
import 'package:beam_tv_1/view/maintenance_billing_screen.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  BillingViewModel billingViewModel = BillingViewModel();

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
              headerWidget(context, 8, "My Billings", false, false),
              ChangeNotifierProvider<BillingViewModel>(
                create: (BuildContext context) => billingViewModel,
                child: Consumer<BillingViewModel>(
                    builder: (context, value, child) {
                  switch (value.billingList.status) {
                    case Status.LOADING:
                      return Loading();
                    case Status.ERROR:
                      return Container(
                        height: size.height(0.8),
                        child: Center(
                          child: Content(
                              data: value.billingList.message.toString(),
                              size: 18),
                        ),
                      );
                    case Status.COMPLETED:
                      final BillingDataModel? billingListData =
                          value.billingList.data;
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          // print(LocalData.id.toString());
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      MaintenanceBillingScreen(
                                                        maintenanceBillingList:
                                                            value.billingList
                                                                .data!,
                                                      )));
                                        },
                                        child: BillingStatus(
                                          paid: billingListData!
                                                      .data!.dueDate!.userStatus
                                                      .toString() ==
                                                  "0"
                                              ? false
                                              : true,
                                          text: "Maintainance Billing",
                                          picture: billing,
                                          colorr: orange,
                                          billingData: billingListData,
                                        ),
                                      ),
                                    ),
                                    billingListData!
                                                .data!.lastWaterBill!.success ==
                                            false
                                        ? Container()
                                        : Container(
                                            margin: EdgeInsets.only(top: 20.h),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            WaterBillingScreen(
                                                                waterBillingList: value
                                                                    .billingList
                                                                    .data!)));
                                              },
                                              child: WaterBillingStatus(
                                                paid: billingListData!
                                                            .data!
                                                            .lastWaterBill!
                                                            .data!
                                                            .first!
                                                            .status
                                                            .toString() ==
                                                        "UnPaid"
                                                    ? false
                                                    : true,
                                                text: "Water Billing",
                                                picture: water,
                                                colorr: primaryShade1,
                                                billingData: billingListData,
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ));
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
