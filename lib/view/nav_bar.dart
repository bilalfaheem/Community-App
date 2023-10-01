import 'package:beam_tv_1/Provider/navbar_provider.dart';
import 'package:beam_tv_1/ViewModel/version_check_view_model.dart';
import 'package:beam_tv_1/resources/components/navbar_widget.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/nav_bar2.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    versi(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Consumer<NavbarProvider>(builder: (context, value, child) {
            return screens[value.screen];
          }),
          //  screens[selectedIndex],
          Positioned(
              // bottom: 1,
              child:
              //  navBar2(context))
              navBar(context))
        ],
      ),
    );
  }
}

versi(context) async {
  final versionCheckViewModel = VersionCheckViewModel();
  String pl = Utils.platformType();
  String _appVersion = await Utils().getAppVersion();
  final data = {"type": pl, "version": _appVersion, "project_id": LocalData.societyId};
  print(data);
  versionCheckViewModel.fetchversionCheckResponse(context,data);
}
