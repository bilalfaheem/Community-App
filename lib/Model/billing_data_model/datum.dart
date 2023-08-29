import 'package:collection/collection.dart';

import 'response.dart';

class Datum {
  String? status;
  int? unPaidMonth;
  int? paidAmount;
  String? payDate;
  String? dueDate;
  double? perUnitPrice;
  List<Response>? response;

  Datum({
    this.status,
    this.unPaidMonth,
    this.paidAmount,
    this.payDate,
    this.dueDate,
    this.perUnitPrice,
    this.response,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json['status'] as String?,
        unPaidMonth: json['UnPaidMonth'] as int?,
        paidAmount: json['paidAmount'] as int?,
        payDate: json['pay_date'] as String?,
        dueDate: json['due_date'] as String?,
        perUnitPrice: (json['per_unit_price'] as num?)?.toDouble(),
        response: (json['response'] as List<dynamic>?)
            ?.map((e) => Response.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'UnPaidMonth': unPaidMonth,
        'paidAmount': paidAmount,
        'pay_date': payDate,
        'due_date': dueDate,
        'per_unit_price': perUnitPrice,
        'response': response?.map((e) => e.toJson()).toList(),
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
      status.hashCode ^
      unPaidMonth.hashCode ^
      paidAmount.hashCode ^
      payDate.hashCode ^
      dueDate.hashCode ^
      perUnitPrice.hashCode ^
      response.hashCode;
}
