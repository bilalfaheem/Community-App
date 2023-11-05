import 'package:collection/collection.dart';

class Datum {
  int? id;
  String? address;
  int? projectId;
  dynamic waterMeter;

  Datum({this.id, this.address, this.projectId, this.waterMeter});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        address: json['address'] as String?,
        projectId: json['project_id'] as int?,
        waterMeter: json['water_meter'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
        'project_id': projectId,
        'water_meter': waterMeter,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ address.hashCode ^ projectId.hashCode ^ waterMeter.hashCode;
}
