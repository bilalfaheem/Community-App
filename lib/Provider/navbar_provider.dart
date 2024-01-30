import 'package:CommunityApp/view/billing_screen.dart';
import 'package:CommunityApp/view/gate_pass_screen.dart';
import 'package:CommunityApp/view/home_screen.dart';
import 'package:CommunityApp/view/tanker_screen.dart';
import 'package:flutter/cupertino.dart';

const screens = [
  HomeScreen(),

  GatePassScreen(),
  TankerScreen(),
  // BillingScreen(),
  BillingScreen()
];

class NavbarProvider with ChangeNotifier {
  int _screen = 0;
  get screen => _screen;

  void changeScreen(int index) {
    // if (index == 0) {
    //   final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    //   homeProvider.changeNavPage();
    //   // homeProvider.changePage(0);
    // }
    _screen = index;
    notifyListeners();
  }
}
