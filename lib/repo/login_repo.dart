import 'package:CommunityApp/Model/login_data_model/login_data_model.dart';
import 'package:CommunityApp/data/network/base_api_services.dart';
import 'package:CommunityApp/data/network/network_api_services.dart';
import 'package:CommunityApp/resources/app_url.dart';

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
