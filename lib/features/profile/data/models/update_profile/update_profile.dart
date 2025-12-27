import 'package:cure/features/auth/domain/entities/user_entity.dart';

import 'patient.dart';

class UpdateProfileModel {
  num? id;
  String? name;
  String? email;
  String? mobile;
  String? birthdate;
  String? gender;
  String? profilePhoto;
  String? role;
  Patient? patient;

  UpdateProfileModel({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.birthdate,
    this.gender,
    this.profilePhoto,
    this.role,
    this.patient,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(
        id: json['id'] as num?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
        birthdate: json['birthdate'] as String?,
        gender: json['gender'] as String?,
        profilePhoto: json['profile_photo'] as String?,
        role: json['role'] as String?,
        patient: json['patient'] == null
            ? null
            : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'birthdate': birthdate,
    'gender': gender,
    'profile_photo': profilePhoto,
    'role': role,
    'patient': patient?.toJson(),
  };

  UserEntity toEntity() => UserEntity(
    id: id ?? 0,
    name: name ?? '',
    email: email ?? '',
    imageUrl: profilePhoto ?? '',
    phone: mobile ?? '',
    patientId: patient?.patientId ?? 0,
  );
}
