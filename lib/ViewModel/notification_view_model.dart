import 'package:CommunityApp/Model/notification_data_model/notification_data_model.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/notification_repo.dart';
import 'package:flutter/material.dart';

class NotificationViewModel with ChangeNotifier {
  final _notificationRepo = NotificationRepo();

  ApiResponse<NotificationDataModel> _notificationList = ApiResponse.loading();
  ApiResponse<NotificationDataModel> get notificationList => _notificationList;

  setNotificationList(ApiResponse<NotificationDataModel> response) {
    _notificationList = response;
    print(_notificationList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchNotificationList() async {
    setNotificationList(ApiResponse.loading());
    _notificationRepo.fetchNotificationList().then((value) {
      print(value);
      setNotificationList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setNotificationList(ApiResponse.error(error.toString()));
    });
  }
}
