import 'package:collection/collection.dart';

import 'pass_list_datum.dart';

class TypeList {
  bool? success;
  String? message;
  List<PassListDatum>? passListData;

  TypeList({this.success, this.message, this.passListData});

  factory TypeList.fromJson(Map<String, dynamic> json) => TypeList(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        passListData: (json['PassListData'] as List<dynamic>?)
            ?.map((e) => PassListDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'PassListData': passListData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TypeList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ passListData.hashCode;
}
