import 'package:collection/collection.dart';

import 'active.dart';
import 'logs_datum.dart';

class RecentActivityDataModel {
  bool? success;
  String? message;
  List<LogsDatum>? logsData;
  Active? active;

  RecentActivityDataModel({
    this.success,
    this.message,
    this.logsData,
    this.active,
  });

  factory RecentActivityDataModel.fromJson(Map<String, dynamic> json) {
    return RecentActivityDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      logsData: (json['logsData'] as List<dynamic>?)
          ?.map((e) => LogsDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      active: json['active'] == null
          ? null
          : Active.fromJson(json['active'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'logsData': logsData?.map((e) => e.toJson()).toList(),
        'active': active?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RecentActivityDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ logsData.hashCode ^ active.hashCode;
}
