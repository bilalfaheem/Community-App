import 'package:collection/collection.dart';

class Data {
  int? status;
  String? message;
  String? deviceVersion;
  String? updatedVersion;
  String? appLink;
  String? versionMode;

  Data({
    this.status,
    this.message,
    this.deviceVersion,
    this.updatedVersion,
    this.appLink,
    this.versionMode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json['status'] as int?,
        message: json['message'] as String?,
        deviceVersion: json['device_version'] as String?,
        updatedVersion: json['updated_version'] as String?,
        appLink: json['app_link'] as String?,
        versionMode: json['version_mode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'device_version': deviceVersion,
        'updated_version': updatedVersion,
        'app_link': appLink,
        'version_mode': versionMode,
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
      status.hashCode ^
      message.hashCode ^
      deviceVersion.hashCode ^
      updatedVersion.hashCode ^
      appLink.hashCode ^
      versionMode.hashCode;
}
