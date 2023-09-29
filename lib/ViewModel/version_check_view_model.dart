import 'dart:async';

import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/Model/version_check_data_model/version_check_data_model.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/version_check_repo.dart';
import 'package:beam_tv_1/resources/components/update_alert.dart';
import 'package:beam_tv_1/view/home_screen.dart';
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

  Future<void> fetchversionCheckResponse(context,Map data) async {
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
