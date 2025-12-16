import 'package:cure/features/auth/domain/entities/user_entity.dart';

import 'data.dart';

class AuthResponse {
  Data? data;
  String? token;

  AuthResponse({this.data, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: json['0'] == null
          ? null
          : Data.fromJson(json['0'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'0': data?.toJson(), 'token': token};

  UserEntity toEntity() => UserEntity(
    id: data?.id ?? 0,
    name: data?.name ?? '',
    email: data?.email ?? '',
    imageUrl: data?.profilePhoto ?? '',
    phone: data?.mobile ?? '',
    patientId: data?.patient?.patientId ?? 0,
  );
}
