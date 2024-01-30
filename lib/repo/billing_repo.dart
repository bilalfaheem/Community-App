import 'package:CommunityApp/Model/billing_data_model/billing_data_model.dart';
import 'package:CommunityApp/Model/billing_data_model2/billing_data_model.dart';
import 'package:CommunityApp/data/network/base_api_services.dart';
import 'package:CommunityApp/data/network/network_api_services.dart';
import 'package:CommunityApp/resources/app_url.dart';

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
