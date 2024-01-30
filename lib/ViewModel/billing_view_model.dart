import 'package:CommunityApp/Model/billing_data_model/billing_data_model.dart';
import 'package:CommunityApp/Model/billing_data_model2/billing_data_model.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/billing_repo.dart';
import 'package:flutter/material.dart';

class BillingViewModel2 with ChangeNotifier {
  final _billingRepo = BillingRepo2();

  ApiResponse<BillingDataModel2> _billingList = ApiResponse.loading();
  ApiResponse<BillingDataModel2> get billingList => _billingList;

  setBillingList(ApiResponse<BillingDataModel2> response) {
    _billingList = response;
    print(_billingList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchBillingList() async {
    setBillingList(ApiResponse.loading());
    _billingRepo.fetchBillingList().then((value) {
      print(value);
      setBillingList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBillingList(ApiResponse.error(error.toString()));
    });
  }
}

class BillingViewModel with ChangeNotifier {
  final _billingRepo = BillingRepo();

  ApiResponse<BillingDataModel> _billingList = ApiResponse.loading();
  ApiResponse<BillingDataModel> get billingList => _billingList;

  setBillingList(ApiResponse<BillingDataModel> response) {
    _billingList = response;
    print(_billingList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchBillingList() async {
    setBillingList(ApiResponse.loading());
    _billingRepo.fetchBillingList().then((value) {
      print(value);
      setBillingList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBillingList(ApiResponse.error(error.toString()));
    });
  }
}
