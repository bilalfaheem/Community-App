import 'package:collection/collection.dart';

class SignupDataModel {
  bool? success;
  String? message;
  dynamic data;

  SignupDataModel({this.success, this.message, this.data});

  factory SignupDataModel.fromJson(Map<String, dynamic> json) {
    return SignupDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as dynamic,
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
    if (other is! SignupDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}
