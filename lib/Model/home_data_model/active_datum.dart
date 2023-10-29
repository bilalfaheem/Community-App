import 'package:collection/collection.dart';

import 'to_user_relation.dart';

class ActiveDatum {
  int? id;
  int? userId;
  int? driverId;
  String? type;
  String? toUser;
  int? isConfirm;
  int? isCanceled;
  int? isCompleted;
  int? isFailed;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deliveryAt;
  ToUserRelation? toUserRelation;

  ActiveDatum({
    this.id,
    this.userId,
    this.driverId,
    this.type,
    this.toUser,
    this.isConfirm,
    this.isCanceled,
    this.isCompleted,
    this.isFailed,
    this.createdAt,
    this.updatedAt,
    this.deliveryAt,
    this.toUserRelation,
  });

  factory ActiveDatum.fromJson(Map<String, dynamic> json) => ActiveDatum(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        driverId: json['driver_id'] as int?,
        type: json['type'] as String?,
        toUser: json['to_user'] as String?,
        isConfirm: json['is_confirm'] as int?,
        isCanceled: json['is_canceled'] as int?,
        isCompleted: json['is_completed'] as int?,
        isFailed: json['is_failed'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deliveryAt: json['delivery_at'] as String?,
        toUserRelation: json['to_user_relation'] == null
            ? null
            : ToUserRelation.fromJson(
                json['to_user_relation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'driver_id': driverId,
        'type': type,
        'to_user': toUser,
        'is_confirm': isConfirm,
        'is_canceled': isCanceled,
        'is_completed': isCompleted,
        'is_failed': isFailed,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'delivery_at': deliveryAt,
        'to_user_relation': toUserRelation?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ActiveDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      driverId.hashCode ^
      type.hashCode ^
      toUser.hashCode ^
      isConfirm.hashCode ^
      isCanceled.hashCode ^
      isCompleted.hashCode ^
      isFailed.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deliveryAt.hashCode ^
      toUserRelation.hashCode;
}
