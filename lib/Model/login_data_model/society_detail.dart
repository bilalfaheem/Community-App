import 'package:collection/collection.dart';

class SocietyDetail {
  int? id;
  String? projectTitle;
  String? projectSlug;
  int? adminId;
  DateTime? createdAt;
  dynamic deletedAt;

  SocietyDetail({
    this.id,
    this.projectTitle,
    this.projectSlug,
    this.adminId,
    this.createdAt,
    this.deletedAt,
  });

  factory SocietyDetail.fromJson(Map<String, dynamic> json) => SocietyDetail(
        id: json['id'] as int?,
        projectTitle: json['project_title'] as String?,
        projectSlug: json['project_slug'] as String?,
        adminId: json['admin_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'project_title': projectTitle,
        'project_slug': projectSlug,
        'admin_id': adminId,
        'created_at': createdAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SocietyDetail) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      projectTitle.hashCode ^
      projectSlug.hashCode ^
      adminId.hashCode ^
      createdAt.hashCode ^
      deletedAt.hashCode;
}
