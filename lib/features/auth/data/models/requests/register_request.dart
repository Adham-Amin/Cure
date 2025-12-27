import 'dart:io';

import 'package:dio/dio.dart';

class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? birthdate;
  String? gender;
  String? mobile;
  String? locationLat;
  String? locationLng;
  File? profilePhoto;
  String? emailOtp;

  RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.birthdate,
    this.gender,
    this.mobile,
    this.locationLat,
    this.locationLng,
    this.profilePhoto,
    this.emailOtp,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      birthdate: json['birthdate'] as String?,
      gender: json['gender'] as String?,
      mobile: json['mobile'] as String?,
      locationLat: json['location_lat'] as String?,
      locationLng: json['location_lng'] as String?,
      profilePhoto: json['profile_photo'] as File?,
      emailOtp: json['email_otp'] as String?,
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'name': name,
      'email': email,
      'password': password,
      'birthdate': birthdate,
      'gender': gender,
      'mobile': mobile,
      'location_lat': locationLat,
      'location_lng': locationLng,
      'email_otp': emailOtp,
      'profile_photo': await MultipartFile.fromFile(profilePhoto!.path),
    };
  }

  Future<Map<String, dynamic>> toUpdate() async => {
    '_method': 'PUT',
    if (name != null && name!.isNotEmpty) 'name': name,
    if (email != null && email!.isNotEmpty) 'email': email,
    if (birthdate != null && birthdate!.isNotEmpty) 'birthdate': birthdate,
    if (gender != null && gender!.isNotEmpty) 'gender': gender,
    if (profilePhoto != null)
      'profile_photo': await MultipartFile.fromFile(profilePhoto!.path),
  };
}
