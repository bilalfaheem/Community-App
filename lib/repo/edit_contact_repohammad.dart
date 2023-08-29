import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';

import '../Model/edit_contact_data_model/edit_contact_data_model.dart';
import '../resources/app_url.dart';

class EditContactRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<EditContactDataModel> fetchEditContactList(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.changeContact, data);
      return response = EditContactDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
