import 'dart:async';

import 'package:beam_tv_1/Model/logout_data_model.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/logout_repo.dart';
import 'package:beam_tv_1/resources/components/logout.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';

class LogoutViewModel with ChangeNotifier {
  final _logoutRepo = LogoutRepo();

  ApiResponse<LogoutDataModel> _logoutResponse = ApiResponse.init();
  ApiResponse<LogoutDataModel> get logoutResponse => _logoutResponse;

  setLogoutResponse(ApiResponse<LogoutDataModel> response) {
    _logoutResponse = response;
    print(_logoutRepo);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchlogoutResponse(Map data, BuildContext context) async {
    setLogoutResponse(ApiResponse.loading());
    _logoutRepo.fetchLogoutResponse(data).then((value) {
      setLogoutResponse(ApiResponse.completed(value));
      logOut(context,true);
      Utils.snackBar('Logout Successfully', context);
    }).onError((error, stackTrace) {
      setLogoutResponse(ApiResponse.error(error.toString()));
      Utils.snackBar('Logout Successfully', context);
      logOut(context,true);
    });
  }
}
