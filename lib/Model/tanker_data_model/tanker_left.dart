import 'package:collection/collection.dart';

import 'left_datum.dart';

class TankerLeft {
  bool? success;
  String? message;
  List<LeftDatum>? leftData;

  TankerLeft({this.success, this.message, this.leftData});

  factory TankerLeft.fromJson(Map<String, dynamic> json) => TankerLeft(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        leftData: (json['leftData'] as List<dynamic>?)
            ?.map((e) => LeftDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'leftData': leftData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TankerLeft) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ leftData.hashCode;
}
