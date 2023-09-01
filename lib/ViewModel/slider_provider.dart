import 'dart:async';

import 'package:flutter/cupertino.dart';

class SliderProvider with ChangeNotifier {
  int _step = 0;
  int get step => _step;

  bool _tenant = false;
  bool get tenant => _tenant;

  // bool _animation = false;
  // bool get animation => _animation;

  bool _forward = true;
  bool get forward => _forward;

  bool _loading = false;
  bool get loading => _loading;

setStep(int index){
_step = index;

}

  setLoadings(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  void stepFunc(bool action) {
    print("<<<<<<<stepfunc<<<<<<$action>>>>>>>>>>>>>");
    if (action == true
        // && _step <3
        ) {
      print("<<<<<<<<<<<<<<<true>>>>>>>>>>>>>>>");
      // _animation = true;
      ++_step;
      notifyListeners();
      print(step);
    } else if (action == false && _step > 0) {
      print("<<<<<<<<<<<<<false>>>>>>>>>>>>>");
      // _animation = true;
      --_step;
      notifyListeners();
      print(step);
    }
    // print("<<<<<<<<<<$_animation>>>>>>>>>>");
    // notifyListeners();
    // print(step);
    // Timer(Duration(seconds: 4), () {
    //   print("duration");
    //   _animation =  false;
    //   notifyListeners();
    //  });
  }

  void tenantFunc(bool value) {
    _tenant = value;
    notifyListeners();
  }

  void setForward(bool value) {
    print("SetForward<<<<<<<<<$value");
    _forward = value;
    notifyListeners();
  }
}
