import 'package:CommunityApp/Model/recent_activity_data_model/recent_activity_data_model.dart';
import 'package:CommunityApp/data/network/base_api_services.dart';
import 'package:CommunityApp/data/network/network_api_services.dart';
import 'package:CommunityApp/resources/app_url.dart';
import 'package:CommunityApp/resources/local_data.dart';

import '../Model/home_data_model/home_data_model.dart';

class HomeRepo {
  BaseApiServices _apiServices = NetworkApiService();
  Future<HomeDataModel> fetchHomeList() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.recentActivityUrl + LocalData.id);

      return response = HomeDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
