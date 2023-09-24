import 'package:beam_tv_1/Model/edit_profile_data_model/edit_profile_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';

class EditProfileRepo {
  BaseApiServices apiServices = NetworkApiService();

  Future<EditProfileDataModel> fetchEditProfileList(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.editProfileUrl, data);
      return response = EditProfileDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
