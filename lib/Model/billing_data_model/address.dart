import 'package:collection/collection.dart';

class Address {
  String? address;

  Address({this.address});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'address': address,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Address) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => address.hashCode;
}
