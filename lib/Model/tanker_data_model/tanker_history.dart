import 'package:collection/collection.dart';

import 'history_datum.dart';

class TankerHistory {
  bool? success;
  String? message;
  List<HistoryDatum>? historyData;

  TankerHistory({this.success, this.message, this.historyData});

  factory TankerHistory.fromJson(Map<String, dynamic> json) => TankerHistory(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        historyData: (json['historyData'] as List<dynamic>?)
            ?.map((e) => HistoryDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'historyData': historyData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TankerHistory) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ historyData.hashCode;
}
