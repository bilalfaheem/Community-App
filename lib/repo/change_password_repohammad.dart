import '../Model/change_password_data_model/change_password_data_model.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../resources/app_url.dart';

class ChangePasswordRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<ChangePasswordDataModel> fetchChanagePasswordList(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.changePassword, data);
      return response = ChangePasswordDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
