import 'package:collection/collection.dart';

class PassUser {
  int? passId;
  String? passUserContactId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  PassUser({
    this.passId,
    this.passUserContactId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory PassUser.fromJson(Map<String, dynamic> json) => PassUser(
        passId: json['pass_id'] as int?,
        passUserContactId: json['pass_user_contact_id'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pass_id': passId,
        'pass_user_contact_id': passUserContactId,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
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
      passId.hashCode ^
      passUserContactId.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      id.hashCode;
}
