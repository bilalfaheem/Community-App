import 'package:collection/collection.dart';

import 'bill.dart';
import 'due_date.dart';
import 'maintenance_history.dart';

class Data {
  DueDate? dueDate;
  Bill? bill;
  MaintenanceHistory? maintenanceHistory;

  Data({this.dueDate, this.bill, this.maintenanceHistory});

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
      );

  Map<String, dynamic> toJson() => {
        'due_date': dueDate?.toJson(),
        'bill': bill?.toJson(),
        'maintenance_history': maintenanceHistory?.toJson(),
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
      dueDate.hashCode ^ bill.hashCode ^ maintenanceHistory.hashCode;
}
