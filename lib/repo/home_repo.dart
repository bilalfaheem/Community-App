import 'package:beam_tv_1/Model/recent_activity_data_model/recent_activity_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';
import 'package:beam_tv_1/resources/local_data.dart';

class HomeRepo {
  BaseApiServices _apiServices = NetworkApiService();
  Future<RecentActivityDataModel> fetchHomeList() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.recentActivityUrl + LocalData.id);

      return response = RecentActivityDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
