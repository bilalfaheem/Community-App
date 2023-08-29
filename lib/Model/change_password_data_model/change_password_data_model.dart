import 'package:collection/collection.dart';

import 'data.dart';

class ChangePasswordDataModel {
  bool? success;
  String? message;
  Data? data;

  ChangePasswordDataModel({this.success, this.message, this.data});

  factory ChangePasswordDataModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ChangePasswordDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}
