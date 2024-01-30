import 'package:CommunityApp/ViewModel/privacy_policy_view_model.dart';
import 'package:CommunityApp/data/response/status.dart';
import 'package:CommunityApp/resources/components/contact_us_tile.dart';
import 'package:CommunityApp/resources/components/content.dart';
import 'package:CommunityApp/resources/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../resources/color.dart';
import '../resources/components/header_widget.dart';
import '../resources/image.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  PrivacyPolicyViewModel privacyPolicyViewModel = PrivacyPolicyViewModel();

  @override
  void initState() {
    privacyPolicyViewModel.fetchprivacyPolicyResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: blueDarkGradient)),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: headerTransparentWidget(
                        context, 8, "Privacy Policy", false)),
                SizedBox(
                  height: 40.h,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.r),
                                    topRight: Radius.circular(50.r)),
                                child: Image.asset(patternbg3)),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 22.h, right: 22.h),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 12.5.h),
                                    child: Content(
                                      data: "Privacy Policy",
                                      size: 22.h,
                                      weight: FontWeight.bold,
                                    )),
                                ChangeNotifierProvider<PrivacyPolicyViewModel>(
                                    create: (BuildContext context) =>
                                        privacyPolicyViewModel,
                                    child: Consumer<PrivacyPolicyViewModel>(
                                      builder: (context, value, child) {
                                        switch (value
                                            .privacyPolicyResponse.status) {
                                          case Status.INIT:
                                            return Container();
                                          case Status.LOADING:
                                            return Loading();
                                          case Status.ERROR:
                                            return Center(
                                              child: Content(
                                                  data: value
                                                      .privacyPolicyResponse
                                                      .message
                                                      .toString(),
                                                  size: 18),
                                            );
                                          case Status.COMPLETED:

                                            // var phoneNumber =
                                            //     privacyPolicyData!.phone;
                                            return Expanded(
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: value
                                                      .privacyPolicyResponse
                                                      .data!
                                                      .data!
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var privacyPolicyData = value
                                                        .privacyPolicyResponse
                                                        .data!
                                                        .data![index];
                                                    return ContactUsTile(
                                                        Title:
                                                            privacyPolicyData!
                                                                .content
                                                                .toString());
                                                  }),
                                            );
                                          case null:
                                        }
                                        return Container();
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
