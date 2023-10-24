import 'package:beam_tv_1/Model/privacy_policy_data_model/privacy_policy_data_model.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/privacy_policy_repo.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyViewModel with ChangeNotifier {
  final _privacyPolicyRepo = PrivacyPolicyRepo();

  ApiResponse<PrivacyPolicyDataModel> _privacyPolicyResponse =
      ApiResponse.init();

  ApiResponse<PrivacyPolicyDataModel> get privacyPolicyResponse =>
      _privacyPolicyResponse;

  setPrivacyPolicyResponse(ApiResponse<PrivacyPolicyDataModel> response) {
    _privacyPolicyResponse = response;
    print(_privacyPolicyResponse);
    notifyListeners();
  }

  Future<void> fetchprivacyPolicyResponse() async {
    setPrivacyPolicyResponse(ApiResponse.loading());
    _privacyPolicyRepo.fetchPrivacyPolicyResponse().then((value) {
      print(value);
      setPrivacyPolicyResponse(ApiResponse.completed(value));
    }).onError((error, StackTrace) {
      setPrivacyPolicyResponse(ApiResponse.error(error.toString()));
    });
  }
}
