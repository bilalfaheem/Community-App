import 'package:collection/collection.dart';

class ContactUsData {
	String? email;
	String? phone;
	String? content;

	ContactUsData({this.email, this.phone, this.content});

	factory ContactUsData.fromJson(Map<String, dynamic> json) => ContactUsData(
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				content: json['content'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'email': email,
				'phone': phone,
				'content': content,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! ContactUsData) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => email.hashCode ^ phone.hashCode ^ content.hashCode;
}
