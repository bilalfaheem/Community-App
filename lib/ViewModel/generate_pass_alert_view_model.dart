import 'package:flutter/material.dart';

class GeneratePassAlertViewModel with ChangeNotifier {
  int _selectedEventIndex = -1;
  int get selectedEventIndex => _selectedEventIndex;

  setSelectedEventIndex(int value) {
    _selectedEventIndex = value;
    notifyListeners();
  }
}
