import 'package:collection/collection.dart';

import 'active.dart';
import 'tanker_history.dart';
import 'tanker_left.dart';

class Data {
  Active? active;
  List<TankerLeft>? tankerLeft;
  TankerHistory? tankerHistory;

  Data({this.active, this.tankerLeft, this.tankerHistory});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        active: json['active'] == null
            ? null
            : Active.fromJson(json['active'] as Map<String, dynamic>),
        tankerLeft: (json['tanker_left'] as List<dynamic>?)
            ?.map((e) => TankerLeft.fromJson(e as Map<String, dynamic>))
            .toList(),
        tankerHistory: json['tanker_history'] == null
            ? null
            : TankerHistory.fromJson(
                json['tanker_history'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'active': active?.toJson(),
        'tanker_left': tankerLeft?.map((e) => e.toJson()).toList(),
        'tanker_history': tankerHistory?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      active.hashCode ^ tankerLeft.hashCode ^ tankerHistory.hashCode;
}
