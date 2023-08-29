import 'package:collection/collection.dart';

class DueDate {
  String? userStatus;
  String? dueDate;
  dynamic paidDate;

  DueDate({this.userStatus, this.dueDate, this.paidDate});

  factory DueDate.fromJson(Map<String, dynamic> json) => DueDate(
        userStatus: json['User_Status'] as String?,
        dueDate: json['due_date'] as String?,
        paidDate: json['paid_date'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'User_Status': userStatus,
        'due_date': dueDate,
        'paid_date': paidDate,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DueDate) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      userStatus.hashCode ^ dueDate.hashCode ^ paidDate.hashCode;
}
