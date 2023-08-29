import 'package:beam_tv_1/Model/test_modell/test_modell.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/test_repo.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _testRepo = TestRepo();

  bool _ss = false;
  bool get ss => _ss;

  ApiResponse<TestModell> _testList = ApiResponse.loading();
  ApiResponse<TestModell> get testList => _testList;

  setSS(bool value) {
    _ss = value;
    print(_ss);
    notifyListeners();
  }

  setTestList(ApiResponse<TestModell> response) {
    _testList = response;
    print(_testList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchTestList() async {
    setTestList(ApiResponse.loading());
    _testRepo.fetchtestList().then((value) {
      print(value);
      setTestList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setTestList(ApiResponse.error(error.toString()));
    });
  }
}
