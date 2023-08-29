import 'package:beam_tv_1/Model/billing_data_model/billing_data_model.dart';
import 'package:beam_tv_1/Model/billing_data_model2/billing_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';

import '../resources/local_data.dart';

class BillingRepo2 {
  BaseApiServices apiServices = NetworkApiService();
  Future<BillingDataModel2> fetchBillingList() async {
    try {
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.billingUrl + LocalData.id.toString());
      return response = BillingDataModel2.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}

class BillingRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<BillingDataModel> fetchBillingList() async {
    try {
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.billingUrl + LocalData.id.toString());
      return response = BillingDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
