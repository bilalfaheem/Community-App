import 'package:collection/collection.dart';

class LogoutDataModel {
  bool? success;
  String? message;
  List<dynamic>? data;

  LogoutDataModel({this.success, this.message, this.data});

  factory LogoutDataModel.fromJson(Map<String, dynamic> json) {
    return LogoutDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LogoutDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}
