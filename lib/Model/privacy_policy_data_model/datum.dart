import 'package:collection/collection.dart';

class Datum {
  int? id;
  int? projectId;
  String? heading;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.projectId,
    this.heading,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        projectId: json['project_id'] as int?,
        heading: json['heading'] as String?,
        content: json['content'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'project_id': projectId,
        'heading': heading,
        'content': content,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      projectId.hashCode ^
      heading.hashCode ^
      content.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
