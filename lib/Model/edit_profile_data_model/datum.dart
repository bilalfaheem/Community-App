import 'package:collection/collection.dart';

class Datum {
  int? id;
  int? projectId;
  String? userProfile;
  String? fullName;
  String? userType;
  String? ownerCnic;
  String? tenantCnic;
  String? unitNo;
  String? houseCategory;
  String? contact;
  int? address;
  String? balance;
  int? tankerLeft;
  int? isSync;
  int? isActive;
  int? isBlock;
  int? isCanceled;
  int? isUpdated;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? password;
  String? qrCode;

  Datum({
    this.id,
    this.projectId,
    this.userProfile,
    this.fullName,
    this.userType,
    this.ownerCnic,
    this.tenantCnic,
    this.unitNo,
    this.houseCategory,
    this.contact,
    this.address,
    this.balance,
    this.tankerLeft,
    this.isSync,
    this.isActive,
    this.isBlock,
    this.isCanceled,
    this.isUpdated,
    this.createdAt,
    this.updatedAt,
    this.password,
    this.qrCode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        projectId: json['project_id'] as int?,
        userProfile: json['user_profile'] as String?,
        fullName: json['full_name'] as String?,
        userType: json['user_type'] as String?,
        ownerCnic: json['owner_cnic'] as String?,
        tenantCnic: json['tenant_cnic'] as String?,
        unitNo: json['unit_no'] as String?,
        houseCategory: json['house_category'] as String?,
        contact: json['contact'] as String?,
        address: json['address'] as int?,
        balance: json['balance'] as String?,
        tankerLeft: json['tanker_left'] as int?,
        isSync: json['is_sync'] as int?,
        isActive: json['is_active'] as int?,
        isBlock: json['is_block'] as int?,
        isCanceled: json['is_canceled'] as int?,
        isUpdated: json['is_updated'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        password: json['password'] as String?,
        qrCode: json['qr_code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'project_id': projectId,
        'user_profile': userProfile,
        'full_name': fullName,
        'user_type': userType,
        'owner_cnic': ownerCnic,
        'tenant_cnic': tenantCnic,
        'unit_no': unitNo,
        'house_category': houseCategory,
        'contact': contact,
        'address': address,
        'balance': balance,
        'tanker_left': tankerLeft,
        'is_sync': isSync,
        'is_active': isActive,
        'is_block': isBlock,
        'is_canceled': isCanceled,
        'is_updated': isUpdated,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'password': password,
        'qr_code': qrCode,
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
      id.hashCode ^
      projectId.hashCode ^
      userProfile.hashCode ^
      fullName.hashCode ^
      userType.hashCode ^
      ownerCnic.hashCode ^
      tenantCnic.hashCode ^
      unitNo.hashCode ^
      houseCategory.hashCode ^
      contact.hashCode ^
      address.hashCode ^
      balance.hashCode ^
      tankerLeft.hashCode ^
      isSync.hashCode ^
      isActive.hashCode ^
      isBlock.hashCode ^
      isCanceled.hashCode ^
      isUpdated.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      password.hashCode ^
      qrCode.hashCode;
}
