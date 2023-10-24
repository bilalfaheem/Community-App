import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/home_repo.dart';
import 'package:flutter/material.dart';

import '../Model/home_data_model/home_data_model.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepo();

  ApiResponse<HomeDataModel> _homeList = ApiResponse.loading();
  ApiResponse<HomeDataModel> get homeList => _homeList;

  setHomeList(ApiResponse<HomeDataModel> response) {
    _homeList = response;
    print(_homeList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchHomeList() async {
    setHomeList(ApiResponse.loading());
    _homeRepo.fetchHomeList().then((value) {
      print(value);
      setHomeList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setHomeList(ApiResponse.error(error.toString()));
    });
  }
}
