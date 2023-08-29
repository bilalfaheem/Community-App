import 'package:flutter/material.dart';

import '../resources/image.dart';

class PasswordVisibilityViewModel with ChangeNotifier {
  bool _obscureText1 = true;
  bool get obscureText1 => _obscureText1;

  bool _obscureText2 = true;
  bool get obscureText2 => _obscureText2;

  bool _obscureText3 = true;
  bool get obscureText3 => _obscureText3;

  String _obscureIcon1 = eye;
  String get obscureIcon1 => _obscureIcon1;

  String _obscureIcon2 = eye;
  String get obscureIcon2 => _obscureIcon2;

  String _obscureIcon3 = eye;
  String get obscureIcon3 => _obscureIcon3;

  void togglePasswordVisibility(int index) {
    switch (index) {
      case 1:
        _obscureText1 = !_obscureText1;
        _obscureIcon1 = toggleIcon(_obscureText1);
        break;
      case 2:
        _obscureText2 = !_obscureText2;
        _obscureIcon2 = toggleIcon(_obscureText2);
        break;
      case 3:
        _obscureText3 = !_obscureText3;
        _obscureIcon3 = toggleIcon(_obscureText3);
        break;
    }
    // _obscureText1 = !_obscureText1;
    // _obscureIcon = toggleIcon();
    notifyListeners();
  }

  getObscure(bool icon, int index) {
    switch (icon) {
      case true:
        switch (index) {
          case 1:
            return _obscureIcon1;
          case 2:
            return _obscureIcon2;
          case 3:
            return _obscureIcon3;
        }
        break;
      case false:
        switch (index) {
          case 1:
            return _obscureText1;
          case 2:
            return _obscureText2;
          case 3:
            return _obscureText3;
        }
        break;
    }
    // switch (index) {
    //   case 1:
    //     return _obscureIcon1;
    //   case 2:
    //     return _obscureIcon2;
    //   case 3:
    //     return _obscureIcon3;
    // }
    // _obscureText1 = !_obscureText1;
    // _obscureIcon = toggleIcon();
    notifyListeners();
  }

  toggleIcon(bool value) {
    switch (value) {
      case true:
        return eye;
      case false:
        return tanker;
    }
  }
}
