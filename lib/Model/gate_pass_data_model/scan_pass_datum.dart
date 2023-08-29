import 'package:collection/collection.dart';

class ScanPassDatum {
  int? id;
  int? userId;
  String? contactName;
  String? contactPhone;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int? passTypeId;
  int? passEventId;
  int? visitorTypeId;
  int? passValidityId;
  String? startDate;
  String? endDate;
  int? addressId;
  String? address;
  String? passTypeName;
  String? eventName;
  String? passHours;
  String? visitorType;

  ScanPassDatum({
    this.id,
    this.userId,
    this.contactName,
    this.contactPhone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.passTypeId,
    this.passEventId,
    this.visitorTypeId,
    this.passValidityId,
    this.startDate,
    this.endDate,
    this.addressId,
    this.address,
    this.passTypeName,
    this.eventName,
    this.passHours,
    this.visitorType,
  });

  factory ScanPassDatum.fromJson(Map<String, dynamic> json) => ScanPassDatum(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        contactName: json['contact_name'] as String?,
        contactPhone: json['contact_phone'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] as dynamic,
        deletedAt: json['deleted_at'] as dynamic,
        passTypeId: json['pass_type_id'] as int?,
        passEventId: json['pass_event_id'] as int?,
        visitorTypeId: json['visitor_type_id'] as int?,
        passValidityId: json['pass_validity_id'] as int?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
        addressId: json['address_id'] as int?,
        address: json['address'] as String?,
        passTypeName: json['pass_type_name'] as String?,
        eventName: json['event_name'] as String?,
        passHours: json['pass_hours'] as String?,
        visitorType: json['visitor_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'contact_name': contactName,
        'contact_phone': contactPhone,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'pass_type_id': passTypeId,
        'pass_event_id': passEventId,
        'visitor_type_id': visitorTypeId,
        'pass_validity_id': passValidityId,
        'start_date': startDate,
        'end_date': endDate,
        'address_id': addressId,
        'address': address,
        'pass_type_name': passTypeName,
        'event_name': eventName,
        'pass_hours': passHours,
        'visitor_type': visitorType,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ScanPassDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      contactName.hashCode ^
      contactPhone.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode ^
      passTypeId.hashCode ^
      passEventId.hashCode ^
      visitorTypeId.hashCode ^
      passValidityId.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      addressId.hashCode ^
      address.hashCode ^
      passTypeName.hashCode ^
      eventName.hashCode ^
      passHours.hashCode ^
      visitorType.hashCode;
}
