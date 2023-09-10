import 'package:collection/collection.dart';

import 'pass.dart';
import 'pass_user.dart';

class Data {
  Pass? pass;
  PassUser? passUser;

  Data({this.pass, this.passUser});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pass: json['Pass'] == null
            ? null
            : Pass.fromJson(json['Pass'] as Map<String, dynamic>),
        passUser: json['passUser'] == null
            ? null
            : PassUser.fromJson(json['passUser'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Pass': pass?.toJson(),
        'passUser': passUser?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => pass.hashCode ^ passUser.hashCode;
}
