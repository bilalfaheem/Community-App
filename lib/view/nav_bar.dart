import 'package:beam_tv_1/ViewModel/version_check_view_model.dart';
import 'package:beam_tv_1/resources/components/navbar_widget.dart';
import 'package:beam_tv_1/Provider/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _versionCheckViewModel = Provider.of<VersionCheckViewModel>(context);
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
              child: navBar(context))
        ],
      ),
    );
  }
}
