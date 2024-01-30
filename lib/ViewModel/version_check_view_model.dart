import 'dart:async';

import 'package:CommunityApp/Function/Navigation/navigate.dart';
import 'package:CommunityApp/Model/version_check_data_model/version_check_data_model.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/version_check_repo.dart';
import 'package:CommunityApp/resources/components/update_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VersionCheckViewModel with ChangeNotifier {
  final _versionCheckRepo = VersionCheckRepo();

  ApiResponse<VersionCheckDataModel> _versionCheckResponse =
      ApiResponse.loading();
  ApiResponse<VersionCheckDataModel> get versionCheckResponse =>
      _versionCheckResponse;

  setVersionCheckResponse(ApiResponse<VersionCheckDataModel> response) {
    _versionCheckResponse = response;
    print(_versionCheckRepo);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchversionCheckResponse(context, Map data) async {
    setVersionCheckResponse(ApiResponse.loading());
    _versionCheckRepo.fetchVersionCheckApi(data).then((value) {
      setVersionCheckResponse(ApiResponse.completed(value));
      if (value.data!.status == 0) {
        print(
            "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<version check>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${value.data!.versionMode}>>>>>>>>>>>>");
        // Get.to(() => UpdateAlert(
        //       forced: value.data!.versionMode == "force",
        //       content: value.data!.message.toString(),
        //       appLink: value.data!.appLink.toString(),
        //     ));
        navigate(
            context,
            UpdateAlert(
              forced: value.data!.versionMode == "force",
              content: value.data!.message.toString(),
              appLink: value.data!.appLink.toString(),
            ));
      }
    }).onError((error, stackTrace) {
      setVersionCheckResponse(ApiResponse.error(error.toString()));
    });
  }
}
