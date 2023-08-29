import 'package:collection/collection.dart';

import 'dues_bill_data.dart';

class Bill {
  bool? success;
  String? message;
  DuesBillData? duesBillData;

  Bill({this.success, this.message, this.duesBillData});

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        duesBillData: json['DuesBillData'] == null
            ? null
            : DuesBillData.fromJson(
                json['DuesBillData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'DuesBillData': duesBillData?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Bill) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ duesBillData.hashCode;
}
