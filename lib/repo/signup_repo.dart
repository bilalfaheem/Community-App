import 'package:beam_tv_1/Model/address_data_model/address_data_model.dart';
import 'package:beam_tv_1/Model/society_data_model/society_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';
import 'package:beam_tv_1/Model/signup_data_model/signup_data_model.dart';

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

  Future<AddressDataModel> fetchAddressList(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.addressUrl, data);
      return response = AddressDataModel.fromJson(response);
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
