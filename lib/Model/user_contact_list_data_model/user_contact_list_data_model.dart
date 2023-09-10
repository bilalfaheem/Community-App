import 'package:collection/collection.dart';

import 'user_contact_list.dart';

class UserContactListDataModel {
  bool? success;
  String? message;
  List<UserContactList>? userContactList;

  UserContactListDataModel({
    this.success,
    this.message,
    this.userContactList,
  });

  factory UserContactListDataModel.fromJson(Map<String, dynamic> json) {
    return UserContactListDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      userContactList: (json['UserContactList'] as List<dynamic>?)
          ?.map((e) => UserContactList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'UserContactList': userContactList?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserContactListDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^ message.hashCode ^ userContactList.hashCode;
}
