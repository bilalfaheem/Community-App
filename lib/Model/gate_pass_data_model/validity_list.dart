import 'package:collection/collection.dart';

import 'validity_datum.dart';

class ValidityList {
  bool? success;
  String? message;
  List<ValidityDatum>? validityData;

  ValidityList({this.success, this.message, this.validityData});

  factory ValidityList.fromJson(Map<String, dynamic> json) => ValidityList(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        validityData: (json['ValidityData'] as List<dynamic>?)
            ?.map((e) => ValidityDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'ValidityData': validityData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ValidityList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ validityData.hashCode;
}
