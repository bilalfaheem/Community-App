import 'package:beam_tv_1/Model/test_model.dart';
import 'package:beam_tv_1/Model/test_modell/test_modell.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';

class TestRepo {
  BaseApiServices _apiServices = NetworkApiService();
  // List<TestModell> testList = [];
  Future<TestModell> fetchtestList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.dailyUrl);
      // testList.clear();
      // dynamic response = data["response"];
      // for (var item in response) {
      //   testList.add(TestModell.fromJson(item));
      // }
      return response = TestModell.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
