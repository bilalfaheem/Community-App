import 'package:collection/collection.dart';

import 'active_data.dart';

class Active {
  bool? success;
  String? message;
  ActiveData? activeData;

  Active({this.success, this.message, this.activeData});

  factory Active.fromJson(Map<String, dynamic> json) => Active(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        activeData: json['activeData'] == null
            ? null
            : ActiveData.fromJson(json['activeData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'activeData': activeData?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Active) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ activeData.hashCode;
}
