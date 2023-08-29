import 'package:collection/collection.dart';

import 'society_detail.dart';

class AddressRelation {
  int? id;
  String? address;
  int? projectId;
  String? waterMeter;
  List<SocietyDetail>? societyDetail;

  AddressRelation({
    this.id,
    this.address,
    this.projectId,
    this.waterMeter,
    this.societyDetail,
  });

  factory AddressRelation.fromJson(Map<String, dynamic> json) {
    return AddressRelation(
      id: json['id'] as int?,
      address: json['address'] as String?,
      projectId: json['project_id'] as int?,
      waterMeter: json['water_meter'] as String?,
      societyDetail: (json['society_detail'] as List<dynamic>?)
          ?.map((e) => SocietyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
        'project_id': projectId,
        'water_meter': waterMeter,
        'society_detail': societyDetail?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AddressRelation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      address.hashCode ^
      projectId.hashCode ^
      waterMeter.hashCode ^
      societyDetail.hashCode;
}
