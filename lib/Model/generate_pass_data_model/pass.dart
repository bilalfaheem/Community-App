import 'package:collection/collection.dart';

class Pass {
  String? passTypeId;
  String? passEventId;
  String? visitorTypeId;
  String? passValidityId;
  String? startDate;
  String? endDate;
  int? addressId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Pass({
    this.passTypeId,
    this.passEventId,
    this.visitorTypeId,
    this.passValidityId,
    this.startDate,
    this.endDate,
    this.addressId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Pass.fromJson(Map<String, dynamic> json) => Pass(
        passTypeId: json['pass_type_id'] as String?,
        passEventId: json['pass_event_id'] as String?,
        visitorTypeId: json['visitor_type_id'] as String?,
        passValidityId: json['pass_validity_id'] as String?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
        addressId: json['address_id'] as int?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pass_type_id': passTypeId,
        'pass_event_id': passEventId,
        'visitor_type_id': visitorTypeId,
        'pass_validity_id': passValidityId,
        'start_date': startDate,
        'end_date': endDate,
        'address_id': addressId,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Pass) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      passTypeId.hashCode ^
      passEventId.hashCode ^
      visitorTypeId.hashCode ^
      passValidityId.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      addressId.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      id.hashCode;
}
