import 'package:flutter/cupertino.dart';

class GatePassProvider with ChangeNotifier {
  bool _active = true;
  bool get active => _active;

//   List<bool> _activeList = [true,false];
// List<bool> get activeList => _activeList;

  void toggleFunc(bool value) {
    _active = value;
    notifyListeners();
  }
}
