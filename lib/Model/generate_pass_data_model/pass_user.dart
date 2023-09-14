import 'package:collection/collection.dart';

import 'user_contact_relation.dart';

class PassUser {
  int? id;
  int? passId;
  int? passUserContactId;
  dynamic qrCode;
  dynamic isScan;
  int? isSms;
  int? isWhatsapp;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  UserContactRelation? userContactRelation;

  PassUser({
    this.id,
    this.passId,
    this.passUserContactId,
    this.qrCode,
    this.isScan,
    this.isSms,
    this.isWhatsapp,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userContactRelation,
  });

  factory PassUser.fromJson(Map<String, dynamic> json) => PassUser(
        id: json['id'] as int?,
        passId: json['pass_id'] as int?,
        passUserContactId: json['pass_user_contact_id'] as int?,
        qrCode: json['qr_code'] as dynamic,
        isScan: json['is_scan'] as dynamic,
        isSms: json['is_sms'] as int?,
        isWhatsapp: json['is_whatsapp'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
        userContactRelation: json['user_contact_relation'] == null
            ? null
            : UserContactRelation.fromJson(
                json['user_contact_relation'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'pass_id': passId,
        'pass_user_contact_id': passUserContactId,
        'qr_code': qrCode,
        'is_scan': isScan,
        'is_sms': isSms,
        'is_whatsapp': isWhatsapp,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'user_contact_relation': userContactRelation?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PassUser) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      passId.hashCode ^
      passUserContactId.hashCode ^
      qrCode.hashCode ^
      isScan.hashCode ^
      isSms.hashCode ^
      isWhatsapp.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      userContactRelation.hashCode;
}
