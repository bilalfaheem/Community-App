import 'package:CommunityApp/Model/signup_data_model/signup_data_model.dart';
import 'package:CommunityApp/Model/society_data_model/society_data_model.dart';
import 'package:CommunityApp/Model/unregistered_address_data_model/unregistered_address_data_model.dart';
import 'package:CommunityApp/data/network/base_api_services.dart';
import 'package:CommunityApp/data/network/network_api_services.dart';
import 'package:CommunityApp/resources/app_url.dart';

class SignupRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<SocietyDataModel> fetchSocietyList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(AppUrl.societyUrl);
      return response = SocietyDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UnregisteredAddressDataModel> fetchUnregisteredAddressList(
      String projectId) async {
    try {
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.unRegisteredAddressUrl + projectId);
      return response = UnregisteredAddressDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<SignupDataModel> fetchSignupResponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.signupUrl, data);
      return response = SignupDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
