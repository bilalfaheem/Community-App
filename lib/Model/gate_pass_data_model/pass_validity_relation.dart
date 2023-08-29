import 'package:collection/collection.dart';

class PassValidityRelation {
  int? id;
  String? hours;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  PassValidityRelation({
    this.id,
    this.hours,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory PassValidityRelation.fromJson(Map<String, dynamic> json) {
    return PassValidityRelation(
      id: json['id'] as int?,
      hours: json['hours'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] as dynamic,
      deletedAt: json['deleted_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'hours': hours,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PassValidityRelation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      hours.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
}
