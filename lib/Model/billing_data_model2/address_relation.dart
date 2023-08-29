import 'package:collection/collection.dart';

class AddressRelation {
  int? id;
  String? address;
  int? projectId;

  AddressRelation({this.id, this.address, this.projectId});

  factory AddressRelation.fromJson(Map<String, dynamic> json) {
    return AddressRelation(
      id: json['id'] as int?,
      address: json['address'] as String?,
      projectId: json['project_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
        'project_id': projectId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AddressRelation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ address.hashCode ^ projectId.hashCode;
}
