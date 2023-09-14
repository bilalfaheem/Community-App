import 'package:collection/collection.dart';

class UserContactRelation {
  int? id;
  int? userId;
  String? contactName;
  String? contactPhone;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  UserContactRelation({
    this.id,
    this.userId,
    this.contactName,
    this.contactPhone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserContactRelation.fromJson(Map<String, dynamic> json) {
    return UserContactRelation(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      contactName: json['contact_name'] as String?,
      contactPhone: json['contact_phone'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] as dynamic,
      deletedAt: json['deleted_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'contact_name': contactName,
        'contact_phone': contactPhone,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserContactRelation) return false;
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
