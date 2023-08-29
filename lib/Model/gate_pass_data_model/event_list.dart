import 'package:collection/collection.dart';

import 'event_datum.dart';

class EventList {
  bool? success;
  String? message;
  List<EventDatum>? eventData;

  EventList({this.success, this.message, this.eventData});

  factory EventList.fromJson(Map<String, dynamic> json) => EventList(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        eventData: (json['EventData'] as List<dynamic>?)
            ?.map((e) => EventDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'EventData': eventData?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EventList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ eventData.hashCode;
}
