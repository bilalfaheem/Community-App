import 'package:CommunityApp/Model/privacy_policy_data_model/privacy_policy_data_model.dart';
import 'package:CommunityApp/data/network/base_api_services.dart';
import 'package:CommunityApp/data/network/network_api_services.dart';
import 'package:CommunityApp/resources/local_data.dart';

import '../resources/app_url.dart';

class PrivacyPolicyRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<PrivacyPolicyDataModel> fetchPrivacyPolicyResponse() async {
    try {
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.privacyPolicyUrl + LocalData.societyId);
      return response = PrivacyPolicyDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
