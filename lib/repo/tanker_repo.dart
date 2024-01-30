import 'package:CommunityApp/Model/tanker_data_model/tanker_data_model.dart';
import 'package:CommunityApp/Model/test_model.dart';
import 'package:CommunityApp/Model/test_modell/test_modell.dart';
import 'package:CommunityApp/data/network/base_api_services.dart';
import 'package:CommunityApp/data/network/network_api_services.dart';
import 'package:CommunityApp/resources/app_url.dart';
import 'package:CommunityApp/resources/local_data.dart';

class TankerRepo {
  BaseApiServices apiServices = NetworkApiService();
  // List<TestModell> testList = [];
  Future<TankerDataModel> fetchTankerList() async {
    try {
      dynamic response = await apiServices.getGetApiResponse(
          AppUrl.tankerUrl + LocalData.id.toString() + "/2023-01-01");
      // testList.clear();
      // dynamic response = data["response"];
      // for (var item in response) {
      //   testList.add(TestModell.fromJson(item));
      // }
      return response = TankerDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
