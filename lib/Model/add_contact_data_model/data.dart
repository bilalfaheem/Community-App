import 'package:collection/collection.dart';

class Data {
	String? userId;
	String? contactName;
	String? contactPhone;
	DateTime? updatedAt;
	DateTime? createdAt;
	int? id;

	Data({
		this.userId, 
		this.contactName, 
		this.contactPhone, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				userId: json['user_id'] as String?,
				contactName: json['contact_name'] as String?,
				contactPhone: json['contact_phone'] as String?,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'user_id': userId,
				'contact_name': contactName,
				'contact_phone': contactPhone,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Data) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			userId.hashCode ^
			contactName.hashCode ^
			contactPhone.hashCode ^
			updatedAt.hashCode ^
			createdAt.hashCode ^
			id.hashCode;
}
