import 'package:collection/collection.dart';

class PassVisitorRelation {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  PassVisitorRelation({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory PassVisitorRelation.fromJson(Map<String, dynamic> json) {
    return PassVisitorRelation(
      id: json['id'] as int?,
      name: json['name'] as String?,
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
        'name': name,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PassVisitorRelation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
}
