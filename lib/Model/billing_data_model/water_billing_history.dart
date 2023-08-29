import 'package:collection/collection.dart';

class WaterBillingHistory {
  int? id;
  int? addressId;
  String? previousReading;
  String? currentReading;
  String? image;
  String? meterNumber;
  int? amount;
  dynamic paymentMethod;
  int? gUserId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isConfirm;

  WaterBillingHistory({
    this.id,
    this.addressId,
    this.previousReading,
    this.currentReading,
    this.image,
    this.meterNumber,
    this.amount,
    this.paymentMethod,
    this.gUserId,
    this.createdAt,
    this.updatedAt,
    this.isConfirm,
  });

  factory WaterBillingHistory.fromJson(Map<String, dynamic> json) {
    return WaterBillingHistory(
      id: json['id'] as int?,
      addressId: json['address_id'] as int?,
      previousReading: json['previous_reading'] as String?,
      currentReading: json['current_reading'] as String?,
      image: json['image'] as String?,
      meterNumber: json['meter_number'] as String?,
      amount: json['amount'] as int?,
      paymentMethod: json['payment_method'] as dynamic,
      gUserId: json['g_user_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isConfirm: json['is_confirm'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'address_id': addressId,
        'previous_reading': previousReading,
        'current_reading': currentReading,
        'image': image,
        'meter_number': meterNumber,
        'amount': amount,
        'payment_method': paymentMethod,
        'g_user_id': gUserId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'is_confirm': isConfirm,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! WaterBillingHistory) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      addressId.hashCode ^
      previousReading.hashCode ^
      currentReading.hashCode ^
      image.hashCode ^
      meterNumber.hashCode ^
      amount.hashCode ^
      paymentMethod.hashCode ^
      gUserId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      isConfirm.hashCode;
}
