import 'package:beam_tv_1/Model/recent_activity_data_model/recent_activity_data_model.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/home_repo.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepo();

  ApiResponse<RecentActivityDataModel> _homeList = ApiResponse.loading();
  ApiResponse<RecentActivityDataModel> get homeList => _homeList;

  setHomeList(ApiResponse<RecentActivityDataModel> response) {
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
