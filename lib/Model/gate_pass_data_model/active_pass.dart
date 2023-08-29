import 'package:collection/collection.dart';

import 'active_pass_datum.dart';

class ActivePass {
  bool? success;
  String? message;
  List<ActivePassDatum>? activePassData;

  ActivePass({this.success, this.message, this.activePassData});

  factory ActivePass.fromJson(Map<String, dynamic> json) => ActivePass(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        activePassData: (json['ActivePassData'] as List<dynamic>?)
            ?.map((e) => ActivePassDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'ActivePassData': activePassData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ActivePass) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ activePassData.hashCode;
}
