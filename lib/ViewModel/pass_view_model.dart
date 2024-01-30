import 'package:CommunityApp/Model/gate_pass_data_model/gate_pass_data_model.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/pass_repo.dart';
import 'package:flutter/material.dart';

class PassViewModel with ChangeNotifier {
  final _passRepo = PassRepo();

  ApiResponse<GatePassDataModel> _passList = ApiResponse.loading();
  ApiResponse<GatePassDataModel> get passList => _passList;

  setPassList(ApiResponse<GatePassDataModel> response) {
    _passList = response;
    print(_passList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchPassList() async {
    setPassList(ApiResponse.loading());
    _passRepo.fetchPassList().then((value) {
      print(value);
      setPassList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setPassList(ApiResponse.error(error.toString()));
    });
  }
}
