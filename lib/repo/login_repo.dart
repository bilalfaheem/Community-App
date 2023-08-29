import 'package:beam_tv_1/Model/login_data_model/login_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';

class LoginRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<LoginDataModel> fetchLoginReponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response = LoginDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
