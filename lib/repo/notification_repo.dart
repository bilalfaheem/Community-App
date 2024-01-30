import 'package:CommunityApp/Model/notification_data_model/notification_data_model.dart';
import 'package:CommunityApp/data/network/base_api_services.dart';
import 'package:CommunityApp/data/network/network_api_services.dart';
import 'package:CommunityApp/resources/app_url.dart';
import 'package:CommunityApp/resources/local_data.dart';

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
