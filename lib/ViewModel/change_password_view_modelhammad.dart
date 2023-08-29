import 'dart:async';

import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:flutter/material.dart';

import '../Model/change_password_data_model/change_password_data_model.dart';
import '../repo/change_password_repohammad.dart';
import '../resources/utils.dart';

class ChangePasswordViewModel with ChangeNotifier {
  final _chanagePasswordRepo = ChangePasswordRepo();

  ApiResponse<ChangePasswordDataModel> _changePasswordList =
      ApiResponse.loading();
  ApiResponse<ChangePasswordDataModel> get changePasswordList =>
      _changePasswordList;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  setchangePasswordList(ApiResponse<ChangePasswordDataModel> response) {
    _changePasswordList = response;
    print(_chanagePasswordRepo);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchchangePasswordList(BuildContext context, Map data) async {
    setLoading(true);
    setchangePasswordList(ApiResponse.loading());
    _chanagePasswordRepo.fetchChanagePasswordList(data).then((value) {
      setLoading(false);
      print(value);
      Utils.snackBar(value.message.toString(), context);
      Navigator.pop(context);
      // Utils.snackBar('Change Password succesfully', context);
      Timer(Duration(seconds: 2), () {});
      setchangePasswordList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      // print(value);
      Utils.snackBar(error.toString(), context);
      setLoading(false);
      setchangePasswordList(ApiResponse.error(error.toString()));
    });
  }
}
