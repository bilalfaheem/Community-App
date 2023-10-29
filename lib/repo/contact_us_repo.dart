import 'dart:developer';

import 'package:beam_tv_1/Model/contact_us_data_model/contact_us_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/local_data.dart';
import '../resources/app_url.dart';

class ContactUsrepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<ContactUsDataModel> fetchContactUsList() async {
    try {
      log("<<<<<<<<<<<<${LocalData.societyId}>>>>>>>>>>>>");
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.contactUsUrl + LocalData.societyId);
      return response = ContactUsDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
