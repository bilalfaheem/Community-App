import 'package:beam_tv_1/Model/add_contact_data_model/add_contact_data_model.dart';
import 'package:beam_tv_1/Model/gate_pass_data_model/gate_pass_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';

class PassRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<GatePassDataModel> fetchPassList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(AppUrl.passUrl);
      return response = GatePassDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
  Future<AddContactDataModel> fetchAddContactResponse(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(AppUrl.addContactUrl,data);
      return response = AddContactDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}