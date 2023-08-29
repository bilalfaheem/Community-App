import 'package:collection/collection.dart';

import 'visitor_datum.dart';

class VisitorList {
  bool? success;
  String? message;
  List<VisitorDatum>? visitorData;

  VisitorList({this.success, this.message, this.visitorData});

  factory VisitorList.fromJson(Map<String, dynamic> json) => VisitorList(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        visitorData: (json['VisitorData'] as List<dynamic>?)
            ?.map((e) => VisitorDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'VisitorData': visitorData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VisitorList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ visitorData.hashCode;
}
