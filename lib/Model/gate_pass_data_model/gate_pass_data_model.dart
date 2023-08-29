import 'package:collection/collection.dart';

import 'active_pass.dart';
import 'event_list.dart';
import 'scanned_pass.dart';
import 'type_list.dart';
import 'validity_list.dart';
import 'visitor_list.dart';

class GatePassDataModel {
  ActivePass? activePass;
  ScannedPass? scannedPass;
  EventList? eventList;
  TypeList? typeList;
  VisitorList? visitorList;
  ValidityList? validityList;

  GatePassDataModel({
    this.activePass,
    this.scannedPass,
    this.eventList,
    this.typeList,
    this.visitorList,
    this.validityList,
  });

  factory GatePassDataModel.fromJson(Map<String, dynamic> json) {
    return GatePassDataModel(
      activePass: json['active_pass'] == null
          ? null
          : ActivePass.fromJson(json['active_pass'] as Map<String, dynamic>),
      scannedPass: json['scanned_pass'] == null
          ? null
          : ScannedPass.fromJson(json['scanned_pass'] as Map<String, dynamic>),
      eventList: json['event_list'] == null
          ? null
          : EventList.fromJson(json['event_list'] as Map<String, dynamic>),
      typeList: json['type_list'] == null
          ? null
          : TypeList.fromJson(json['type_list'] as Map<String, dynamic>),
      visitorList: json['visitor_list'] == null
          ? null
          : VisitorList.fromJson(json['visitor_list'] as Map<String, dynamic>),
      validityList: json['validity_list'] == null
          ? null
          : ValidityList.fromJson(
              json['validity_list'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'active_pass': activePass?.toJson(),
        'scanned_pass': scannedPass?.toJson(),
        'event_list': eventList?.toJson(),
        'type_list': typeList?.toJson(),
        'visitor_list': visitorList?.toJson(),
        'validity_list': validityList?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GatePassDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      activePass.hashCode ^
      scannedPass.hashCode ^
      eventList.hashCode ^
      typeList.hashCode ^
      visitorList.hashCode ^
      validityList.hashCode;
}
