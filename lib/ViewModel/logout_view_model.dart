import 'dart:async';

import 'package:CommunityApp/Model/logout_data_model.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/logout_repo.dart';
import 'package:CommunityApp/resources/components/logout.dart';
import 'package:CommunityApp/resources/utils.dart';
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
      logOut(context, true);
      Utils.snackBar('Logout Successfully', context);
    }).onError((error, stackTrace) {
      setLogoutResponse(ApiResponse.error(error.toString()));
      Utils.snackBar('Logout Successfully', context);
      logOut(context, true);
    });
  }
}
