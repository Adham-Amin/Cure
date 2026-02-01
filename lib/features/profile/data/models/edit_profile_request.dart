import 'dart:io';

import 'package:dio/dio.dart';

class EditProfileRequest {
  String? name;
  String? email;
  String? phone;
  File? image;
  int? birthDay;
  int? birthMonth;
  int? birthYear;
  String? address;

  EditProfileRequest({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.birthDay,
    this.birthMonth,
    this.birthYear,
    this.address,
  });

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) {
    return EditProfileRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as File?,
      birthDay: json['birthDay'] as int?,
      birthMonth: json['birthMonth'] as int?,
      birthYear: json['birthYear'] as int?,
      address: json['address'] as String?,
    );
  }
  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = {};

    if (name != null && name!.isNotEmpty) {
      data['name'] = name;
    }

    if (email != null && email!.isNotEmpty) {
      data['email'] = email;
    }

    if (phone != null && phone!.isNotEmpty) {
      data['phone'] = phone;
    }

    if (address != null && address!.isNotEmpty) {
      data['address'] = address;
    }

    if (birthDay != null) {
      data['birthDay'] = birthDay;
    }

    if (birthMonth != null) {
      data['birthMonth'] = birthMonth;
    }

    if (birthYear != null) {
      data['birthYear'] = birthYear;
    }

    if (image != null) {
      data['image'] = await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
      );
    }

    return data;
  }
}
