import 'package:CommunityApp/Model/tanker_data_model/tanker_data_model.dart';
import 'package:CommunityApp/Model/test_modell/test_modell.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/tanker_repo.dart';
import 'package:flutter/material.dart';

class TankerViewModel with ChangeNotifier {
  final _tankerRepo = TankerRepo();

  ApiResponse<TankerDataModel> _tankerList = ApiResponse.loading();
  ApiResponse<TankerDataModel> get tankerList => _tankerList;

  setTankerList(ApiResponse<TankerDataModel> response) {
    _tankerList = response;
    print(_tankerList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchTankerList() async {
    setTankerList(ApiResponse.loading());
    _tankerRepo.fetchTankerList().then((value) {
      print(value);
      setTankerList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setTankerList(ApiResponse.error(error.toString()));
    });
  }
}
