import 'package:collection/collection.dart';

import 'scan_pass_datum.dart';

class ScannedPass {
  bool? success;
  String? message;
  List<ScanPassDatum>? scanPassData;

  ScannedPass({this.success, this.message, this.scanPassData});

  factory ScannedPass.fromJson(Map<String, dynamic> json) => ScannedPass(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        scanPassData: (json['ScanPassData'] as List<dynamic>?)
            ?.map((e) => ScanPassDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'ScanPassData': scanPassData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ScannedPass) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ scanPassData.hashCode;
}
