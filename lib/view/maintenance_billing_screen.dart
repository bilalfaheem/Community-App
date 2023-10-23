import 'package:beam_tv_1/Model/billing_data_model/billing_data_model.dart';
import 'package:beam_tv_1/resources/components/my_billing.dart';
import 'package:beam_tv_1/resources/components/header_widget.dart';
import 'package:beam_tv_1/resources/components/my_billing_date.dart';
import 'package:beam_tv_1/resources/components/my_billing_history.dart';
import 'package:beam_tv_1/resources/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaintenanceBillingScreen extends StatefulWidget {
  MaintenanceBillingScreen({super.key, required this.maintenanceBillingList});
  final BillingDataModel maintenanceBillingList;

  @override
  State<MaintenanceBillingScreen> createState() =>
      _MaintenanceBillingScreenState();
}

class _MaintenanceBillingScreenState extends State<MaintenanceBillingScreen> {
  // BillingViewModel2 billingViewModel = BillingViewModel2();

  // @override
  // void initState() {
  //   billingViewModel.fetchBillingList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final size = SizeConfig(context);
    // final billingViewModell =
    //     Provider.of<BillingViewModel>(context, listen: false);
    // final billingListData = billingViewModell.billingList.data;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // ChangeNotifierProvider<BillingViewModel2>(
              //   create: (BuildContext context) => billingViewModel,
              //   child: Consumer<BillingViewModel2>(
              //       builder: (context, value, child) {
              //     switch (value.billingList.status) {
              //       case Status.LOADING:
              //         return Loading();
              //       case Status.ERROR:
              //         return Center(
              //           child: Content(
              //               data: value.billingList.message.toString(),
              //               size: 18),
              //         );
              //       case Status.COMPLETED:
              //         final BillingDataModel2? billingListData =
              //             value.billingList.data;
              //         return
              Container(
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
                                context, 8, "Maintenance Billing", false, true),
                            MyBilling(
                              month: widget.maintenanceBillingList.data!.bill!
                                  .duesBillData!.dueMonth
                                  .toString(),
                            ),
                            MyBillingDate(
                                paid: widget.maintenanceBillingList!.data!
                                            .dueDate!.userStatus
                                            .toString() ==
                                        "0"
                                    ? false
                                    : true,
                                billData:
                                    widget.maintenanceBillingList.data!.bill,
                                // .data!.bill ,
                                dueData: widget
                                    .maintenanceBillingList.data!.dueDate),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: availableHeight * 0.5,
                        child: MyBillingHistory(
                            history: widget.maintenanceBillingList.data!
                                .maintenanceHistory!),
                      )
                    ],
                  );
                }),
              )
              //     ;
              // }
              // return Container();
              // }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
