import 'package:collection/collection.dart';

import 'contact_us_data.dart';

class ContactUsDataModel {
	bool? success;
	String? message;
	ContactUsData? contactUsData;

	ContactUsDataModel({this.success, this.message, this.contactUsData});

	factory ContactUsDataModel.fromJson(Map<String, dynamic> json) {
		return ContactUsDataModel(
			success: json['success'] as bool?,
			message: json['message'] as String?,
			contactUsData: json['ContactUsData'] == null
						? null
						: ContactUsData.fromJson(json['ContactUsData'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'message': message,
				'ContactUsData': contactUsData?.toJson(),
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! ContactUsDataModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			success.hashCode ^
			message.hashCode ^
			contactUsData.hashCode;
}
