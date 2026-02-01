import 'package:cure/features/auth/domain/entities/user_entity.dart';

import 'data.dart';

class EditProfileResponse {
  bool? success;
  String? message;
  Data? data;

  EditProfileResponse({this.success, this.message, this.data});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return EditProfileResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };

  UserEntity toEntity() => UserEntity(
    name: data?.name ?? '',
    email: data?.email ?? '',
    phone: data?.phone ?? '',
    imageUrl: data?.image,
    address: data?.address,
    birthdate:
        '${data?.birthdate?.day}/${data?.birthdate?.month}/${data?.birthdate?.year}',
  );
}
