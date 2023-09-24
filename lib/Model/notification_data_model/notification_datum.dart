import 'package:collection/collection.dart';

class NotificationDatum {
  int? notificationId;
  int? projectId;
  String? notificationType;
  String? message;
  int? notificationUserId;
  String? status;
  String? notificationCreatedAt;
  dynamic notificationUpdatedAt;
  int? isSeen;
  int? isRead;
  int? userId;
  String? fullName;

  NotificationDatum({
    this.notificationId,
    this.projectId,
    this.notificationType,
    this.message,
    this.notificationUserId,
    this.status,
    this.notificationCreatedAt,
    this.notificationUpdatedAt,
    this.isSeen,
    this.isRead,
    this.userId,
    this.fullName,
  });

  factory NotificationDatum.fromJson(Map<String, dynamic> json) {
    return NotificationDatum(
      notificationId: json['notification_id'] as int?,
      projectId: json['project_id'] as int?,
      notificationType: json['notification_type'] as String?,
      message: json['message'] as String?,
      notificationUserId: json['notification_user_id'] as int?,
      status: json['status'] as String?,
      notificationCreatedAt: json['notification_created_at'] as String?,
      notificationUpdatedAt: json['notification_updated_at'] as dynamic,
      isSeen: json['is_seen'] as int?,
      isRead: json['is_read'] as int?,
      userId: json['user_id'] as int?,
      fullName: json['full_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'notification_id': notificationId,
        'project_id': projectId,
        'notification_type': notificationType,
        'message': message,
        'notification_user_id': notificationUserId,
        'status': status,
        'notification_created_at': notificationCreatedAt,
        'notification_updated_at': notificationUpdatedAt,
        'is_seen': isSeen,
        'is_read': isRead,
        'user_id': userId,
        'full_name': fullName,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NotificationDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      notificationId.hashCode ^
      projectId.hashCode ^
      notificationType.hashCode ^
      message.hashCode ^
      notificationUserId.hashCode ^
      status.hashCode ^
      notificationCreatedAt.hashCode ^
      notificationUpdatedAt.hashCode ^
      isSeen.hashCode ^
      isRead.hashCode ^
      userId.hashCode ^
      fullName.hashCode;
}
