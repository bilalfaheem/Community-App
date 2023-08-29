import 'package:collection/collection.dart';

import 'response.dart';

class TestModell {
  int? status;
  String? message;
  List<Response>? response;

  TestModell({this.status, this.message, this.response});

  factory TestModell.fromJson(Map<String, dynamic> json) => TestModell(
        status: json['status'] as int?,
        message: json['message'] as String?,
        response: (json['response'] as List<dynamic>?)
            ?.map((e) => Response.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'response': response?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TestModell) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ response.hashCode;
}
