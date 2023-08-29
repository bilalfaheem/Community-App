import 'package:collection/collection.dart';

import 'pass_event_relation.dart';
import 'pass_type_relation.dart';
import 'pass_validity_relation.dart';
import 'pass_visitor_relation.dart';

class ActivePassDatum {
  int? id;
  int? passTypeId;
  int? passEventId;
  int? visitorTypeId;
  int? passValidityId;
  String? startDate;
  String? endDate;
  int? addressId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  PassTypeRelation? passTypeRelation;
  PassValidityRelation? passValidityRelation;
  PassEventRelation? passEventRelation;
  PassVisitorRelation? passVisitorRelation;

  ActivePassDatum({
    this.id,
    this.passTypeId,
    this.passEventId,
    this.visitorTypeId,
    this.passValidityId,
    this.startDate,
    this.endDate,
    this.addressId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.passTypeRelation,
    this.passValidityRelation,
    this.passEventRelation,
    this.passVisitorRelation,
  });

  factory ActivePassDatum.fromJson(Map<String, dynamic> json) {
    return ActivePassDatum(
      id: json['id'] as int?,
      passTypeId: json['pass_type_id'] as int?,
      passEventId: json['pass_event_id'] as int?,
      visitorTypeId: json['visitor_type_id'] as int?,
      passValidityId: json['pass_validity_id'] as int?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      addressId: json['address_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] as dynamic,
      passTypeRelation: json['pass_type_relation'] == null
          ? null
          : PassTypeRelation.fromJson(
              json['pass_type_relation'] as Map<String, dynamic>),
      passValidityRelation: json['pass_validity_relation'] == null
          ? null
          : PassValidityRelation.fromJson(
              json['pass_validity_relation'] as Map<String, dynamic>),
      passEventRelation: json['pass_event_relation'] == null
          ? null
          : PassEventRelation.fromJson(
              json['pass_event_relation'] as Map<String, dynamic>),
      passVisitorRelation: json['pass_visitor_relation'] == null
          ? null
          : PassVisitorRelation.fromJson(
              json['pass_visitor_relation'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'pass_type_id': passTypeId,
        'pass_event_id': passEventId,
        'visitor_type_id': visitorTypeId,
        'pass_validity_id': passValidityId,
        'start_date': startDate,
        'end_date': endDate,
        'address_id': addressId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'pass_type_relation': passTypeRelation?.toJson(),
        'pass_validity_relation': passValidityRelation?.toJson(),
        'pass_event_relation': passEventRelation?.toJson(),
        'pass_visitor_relation': passVisitorRelation?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ActivePassDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      passTypeId.hashCode ^
      passEventId.hashCode ^
      visitorTypeId.hashCode ^
      passValidityId.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      addressId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      passTypeRelation.hashCode ^
      passValidityRelation.hashCode ^
      passEventRelation.hashCode ^
      passVisitorRelation.hashCode;
}
