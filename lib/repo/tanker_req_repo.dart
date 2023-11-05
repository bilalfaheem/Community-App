import 'package:beam_tv_1/Model/address_data_model/address_data_model.dart';
import 'package:beam_tv_1/Model/login_data_model/login_data_model.dart';
import 'package:beam_tv_1/Model/tanker_req_data_model/tanker_req_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';

class TankerReqRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<TankerReqDataModel> fetchTankerReqReponse(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.requestTankerUrl, data);
      return response = TankerReqDataModel.fromJson(response);
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

}
