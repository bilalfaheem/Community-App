import 'package:collection/collection.dart';

class DuesBillData {
  int? dueAmount;
  String? dueMonth;

  DuesBillData({this.dueAmount, this.dueMonth});

  factory DuesBillData.fromJson(Map<String, dynamic> json) => DuesBillData(
        dueAmount: json['Due_Amount'] as int?,
        dueMonth: json['Due_Month'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Due_Amount': dueAmount,
        'Due_Month': dueMonth,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DuesBillData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => dueAmount.hashCode ^ dueMonth.hashCode;
}
