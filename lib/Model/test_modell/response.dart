import 'package:collection/collection.dart';

class Response {
  String? id;
  String? day;
  String? mainHeading;
  String? subHeading;
  String? title;
  String? content;
  String? isRightAlign;
  String? date;
  String? createdAt;
  int? isSelected;

  Response({
    this.id,
    this.day,
    this.mainHeading,
    this.subHeading,
    this.title,
    this.content,
    this.isRightAlign,
    this.date,
    this.createdAt,
    this.isSelected,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json['id'] as String?,
        day: json['day'] as String?,
        mainHeading: json['main_heading'] as String?,
        subHeading: json['sub_heading'] as String?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        isRightAlign: json['is_right_align'] as String?,
        date: json['date'] as String?,
        createdAt: json['created_at'] as String?,
        isSelected: json['is_selected'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'day': day,
        'main_heading': mainHeading,
        'sub_heading': subHeading,
        'title': title,
        'content': content,
        'is_right_align': isRightAlign,
        'date': date,
        'created_at': createdAt,
        'is_selected': isSelected,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Response) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      day.hashCode ^
      mainHeading.hashCode ^
      subHeading.hashCode ^
      title.hashCode ^
      content.hashCode ^
      isRightAlign.hashCode ^
      date.hashCode ^
      createdAt.hashCode ^
      isSelected.hashCode;
}
