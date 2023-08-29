import 'package:collection/collection.dart';

import 'maintenance_history_datum.dart';

class MaintenanceHistory {
  bool? success;
  String? message;
  List<MaintenanceHistoryDatum>? maintenanceHistoryData;

  MaintenanceHistory({
    this.success,
    this.message,
    this.maintenanceHistoryData,
  });

  factory MaintenanceHistory.fromJson(Map<String, dynamic> json) {
    return MaintenanceHistory(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      maintenanceHistoryData: (json['MaintenanceHistoryData'] as List<dynamic>?)
          ?.map((e) =>
              MaintenanceHistoryDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'MaintenanceHistoryData':
            maintenanceHistoryData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MaintenanceHistory) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ maintenanceHistoryData.hashCode;
}
