import 'package:cure/features/auth/domain/entities/user_entity.dart';

import 'extra_data.dart';

class UserInfoResponse {
  String? name;
  String? email;
  String? phone;
  dynamic image;
  dynamic address;
  ExtraData? extraData;

  UserInfoResponse({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.address,
    this.extraData,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as dynamic,
      address: json['address'] as dynamic,
      extraData: json['extra_data'] == null
          ? null
          : ExtraData.fromJson(json['extra_data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'image': image,
    'address': address,
    'extra_data': extraData?.toJson(),
  };

  UserEntity toEntity() => UserEntity(
    name: name ?? '',
    email: email ?? '',
    phone: phone ?? '',
    imageUrl: image,
    address: address,
  );
}
