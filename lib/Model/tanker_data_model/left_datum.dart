import 'package:collection/collection.dart';

class LeftDatum {
  String? tankerLeft;

  LeftDatum({this.tankerLeft});

  factory LeftDatum.fromJson(Map<String, dynamic> json) => LeftDatum(
        tankerLeft: json['tanker_left'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tanker_left': tankerLeft,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LeftDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => tankerLeft.hashCode;
}
