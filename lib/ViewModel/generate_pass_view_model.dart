import 'package:flutter/material.dart';

class GeneratePassViewModel with ChangeNotifier {
  // GeneratePassViewModel() {
  //   initialize();
  // }
  bool _contactField = false;
  bool get contactField => _contactField;

  String _event = "Select Event";
  String get event => _event;

  setStep(bool status) {
    _contactField = status;
    notifyListeners();
  }

  void initialize() {
    print("Initializes");
    _contactField = false;
    print(_contactField);
  }
  // Future<void> step(bool status){
  //   contactField
  // }
}
