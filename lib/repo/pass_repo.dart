import 'dart:convert';

import 'package:beam_tv_1/Model/add_contact_data_model/add_contact_data_model.dart';
import 'package:beam_tv_1/Model/gate_pass_data_model/gate_pass_data_model.dart';
import 'package:beam_tv_1/Model/generate_pass_data_model/generate_pass_data_model.dart';
import 'package:beam_tv_1/Model/user_contact_list_data_model/user_contact_list_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';
import 'package:beam_tv_1/resources/local_data.dart';

class PassRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<GatePassDataModel> fetchPassList() async {
    try {
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.passUrl + LocalData.addressId);
      return response = GatePassDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AddContactDataModel> fetchAddContactResponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.addContactUrl, data);
      return response = AddContactDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<GeneratePassDataModel> fetchGeneratePassResponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.generatePassUrl, data);
      print(response);

      return response = GeneratePassDataModel.fromJson(response);
    } catch (e) {
      print("<<<$e>>>");
      throw e;
    }
  }

  Future<UserContactListDataModel> fetchUserContactListResponse() async {
    try {
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.userContactListUrl + LocalData.addressId);
      return response = UserContactListDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
