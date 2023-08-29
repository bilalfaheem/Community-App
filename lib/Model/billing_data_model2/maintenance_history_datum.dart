import 'package:collection/collection.dart';

import 'user_relation.dart';

class MaintenanceHistoryDatum {
  int? id;
  int? projectId;
  int? userId;
  String? amount;
  String? date;
  DateTime? createdAt;
  UserRelation? userRelation;

  MaintenanceHistoryDatum({
    this.id,
    this.projectId,
    this.userId,
    this.amount,
    this.date,
    this.createdAt,
    this.userRelation,
  });

  factory MaintenanceHistoryDatum.fromJson(Map<String, dynamic> json) {
    return MaintenanceHistoryDatum(
      id: json['id'] as int?,
      projectId: json['project_id'] as int?,
      userId: json['user_id'] as int?,
      amount: json['amount'] as String?,
      date: json['date'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      userRelation: json['user_relation'] == null
          ? null
          : UserRelation.fromJson(
              json['user_relation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'project_id': projectId,
        'user_id': userId,
        'amount': amount,
        'date': date,
        'created_at': createdAt?.toIso8601String(),
        'user_relation': userRelation?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MaintenanceHistoryDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      projectId.hashCode ^
      userId.hashCode ^
      amount.hashCode ^
      date.hashCode ^
      createdAt.hashCode ^
      userRelation.hashCode;
}
