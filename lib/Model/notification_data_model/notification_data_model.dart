import 'package:collection/collection.dart';

import 'notification_datum.dart';

class NotificationDataModel {
  bool? success;
  String? message;
  List<NotificationDatum>? notificationData;

  NotificationDataModel({
    this.success,
    this.message,
    this.notificationData,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) {
    return NotificationDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      notificationData: (json['NotificationData'] as List<dynamic>?)
          ?.map((e) => NotificationDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'NotificationData': notificationData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NotificationDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ notificationData.hashCode;
}
