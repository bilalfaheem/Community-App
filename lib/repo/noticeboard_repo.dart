import 'package:CommunityApp/Model/billing_data_model2/billing_data_model.dart';
import 'package:CommunityApp/Model/noticeboard_data_model/noticeboard_data_model.dart';
import 'package:CommunityApp/data/network/base_api_services.dart';
import 'package:CommunityApp/data/network/network_api_services.dart';
import 'package:CommunityApp/resources/app_url.dart';
import 'package:CommunityApp/resources/local_data.dart';

class NoticeboardRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<NoticeboardDataModel> fetchNoticeboardList() async {
    try {
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.noticeUrl + LocalData.societyId);
      return response = NoticeboardDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
