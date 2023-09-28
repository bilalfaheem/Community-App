import 'package:beam_tv_1/Model/version_check_data_model/version_check_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';

class VersionCheckRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<VersionCheckDataModel> fetchVersionCheckApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.versionUrl, data);
      return response = VersionCheckDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
