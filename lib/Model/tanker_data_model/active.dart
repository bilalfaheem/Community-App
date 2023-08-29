import 'package:collection/collection.dart';

import 'active_datum.dart';

class Active {
  bool? success;
  String? message;
  List<ActiveDatum>? activeData;

  Active({this.success, this.message, this.activeData});

  factory Active.fromJson(Map<String, dynamic> json) => Active(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        activeData: (json['activeData'] as List<dynamic>?)
            ?.map((e) => ActiveDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'activeData': activeData?.map((e) => e.toJson()).toList(),
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
