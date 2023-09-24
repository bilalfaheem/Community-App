import 'package:beam_tv_1/Model/billing_data_model2/billing_data_model.dart';
import 'package:beam_tv_1/Model/noticeboard_data_model/noticeboard_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';
import 'package:beam_tv_1/resources/local_data.dart';

class NoticeboardRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<NoticeboardDataModel> fetchNoticeboardList() async {
    try {
      dynamic response =
          await apiServices.getGetApiResponse(AppUrl.noticeUrl + LocalData.id);
      return response = NoticeboardDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
