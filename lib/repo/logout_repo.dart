import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';
import '../Model/logout_data_model.dart';

class LogoutRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<LogoutDataModel> fetchLogoutResponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.logoutUrl, data);
      return response = LogoutDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
