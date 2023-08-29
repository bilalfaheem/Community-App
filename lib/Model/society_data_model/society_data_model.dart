import 'package:collection/collection.dart';

import 'datum.dart';

class SocietyDataModel {
  bool? success;
  String? message;
  List<Datum>? data;

  SocietyDataModel({this.success, this.message, this.data});

  factory SocietyDataModel.fromJson(Map<String, dynamic> json) {
    return SocietyDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SocietyDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}
