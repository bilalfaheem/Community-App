import 'package:collection/collection.dart';

class UserContactList {
  int? id;
  int? userId;
  String? contactName;
  String? contactPhone;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  UserContactList({
    this.id,
    this.userId,
    this.contactName,
    this.contactPhone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserContactList.fromJson(Map<String, dynamic> json) {
    return UserContactList(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      contactName: json['contact_name'] as String?,
      contactPhone: json['contact_phone'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'contact_name': contactName,
        'contact_phone': contactPhone,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserContactList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      contactName.hashCode ^
      contactPhone.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
}
