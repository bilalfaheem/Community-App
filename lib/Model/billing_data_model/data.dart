import 'package:collection/collection.dart';

import 'bill.dart';
import 'due_date.dart';
import 'last_water_bill.dart';
import 'maintenance_history.dart';
import 'water_billing_history.dart';

class Data {
  DueDate? dueDate;
  Bill? bill;
  MaintenanceHistory? maintenanceHistory;
  LastWaterBill? lastWaterBill;
  List<WaterBillingHistory>? waterBillingHistory;

  Data({
    this.dueDate,
    this.bill,
    this.maintenanceHistory,
    this.lastWaterBill,
    this.waterBillingHistory,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dueDate: json['due_date'] == null
            ? null
            : DueDate.fromJson(json['due_date'] as Map<String, dynamic>),
        bill: json['bill'] == null
            ? null
            : Bill.fromJson(json['bill'] as Map<String, dynamic>),
        maintenanceHistory: json['maintenance_history'] == null
            ? null
            : MaintenanceHistory.fromJson(
                json['maintenance_history'] as Map<String, dynamic>),
        lastWaterBill: json['last_water_bill'] == null
            ? null
            : LastWaterBill.fromJson(
                json['last_water_bill'] as Map<String, dynamic>),
        waterBillingHistory: (json['water_billing_history'] as List<dynamic>?)
            ?.map(
                (e) => WaterBillingHistory.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'due_date': dueDate?.toJson(),
        'bill': bill?.toJson(),
        'maintenance_history': maintenanceHistory?.toJson(),
        'last_water_bill': lastWaterBill?.toJson(),
        'water_billing_history':
            waterBillingHistory?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      dueDate.hashCode ^
      bill.hashCode ^
      maintenanceHistory.hashCode ^
      lastWaterBill.hashCode ^
      waterBillingHistory.hashCode;
}
