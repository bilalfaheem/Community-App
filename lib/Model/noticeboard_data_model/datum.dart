import 'package:collection/collection.dart';

class Datum {
  int? id;
  int? projectId;
  String? title;
  String? color;
  String? icon;
  String? content;
  String? type;
  String? date;
  String? expireAt;
  DateTime? createdAt;

  Datum({
    this.id,
    this.projectId,
    this.title,
    this.color,
    this.icon,
    this.content,
    this.type,
    this.date,
    this.expireAt,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        projectId: json['project_id'] as int?,
        title: json['title'] as String?,
        color: json['color'] as String?,
        icon: json['icon'] as String?,
        content: json['content'] as String?,
        type: json['type'] as String?,
        date: json['date'] as String?,
        expireAt: json['expire_at'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'project_id': projectId,
        'title': title,
        'color': color,
        'icon': icon,
        'content': content,
        'type': type,
        'date': date,
        'expire_at': expireAt,
        'created_at': createdAt?.toIso8601String(),
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
      title.hashCode ^
      color.hashCode ^
      icon.hashCode ^
      content.hashCode ^
      type.hashCode ^
      date.hashCode ^
      expireAt.hashCode ^
      createdAt.hashCode;
}
