import 'package:beam_tv_1/Model/notification_data_model/notification_data_model.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:beam_tv_1/data/network/network_api_services.dart';
import 'package:beam_tv_1/resources/app_url.dart';
import 'package:beam_tv_1/resources/local_data.dart';

class NotificationRepo {
  BaseApiServices apiServices = NetworkApiService();
  Future<NotificationDataModel> fetchNotificationList() async {
    try {
      dynamic response = await apiServices
          .getGetApiResponse(AppUrl.notificationUrl + LocalData.id);
      return response = NotificationDataModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
