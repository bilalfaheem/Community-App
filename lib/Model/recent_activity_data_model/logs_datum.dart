import 'package:collection/collection.dart';

class LogsDatum {
  String? type;
  String? status;
  String? date;
  String? time;
  String? amount;
  String? content;

  LogsDatum({
    this.type,
    this.status,
    this.date,
    this.time,
    this.amount,
    this.content,
  });

  factory LogsDatum.fromJson(Map<String, dynamic> json) => LogsDatum(
        type: json['type'] as String?,
        status: json['status'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
        amount: json['amount'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'status': status,
        'date': date,
        'time': time,
        'amount': amount,
        'content': content,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LogsDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      type.hashCode ^
      status.hashCode ^
      date.hashCode ^
      time.hashCode ^
      amount.hashCode ^
      content.hashCode;
}
