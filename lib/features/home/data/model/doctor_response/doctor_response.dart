import 'package:cure/features/home/domain/entities/doctor_entity.dart';

import 'location.dart';
import 'specialty.dart';

class DoctorResponse {
  int? id;
  String? name;
  String? email;
  dynamic mobile;
  String? address;
  dynamic profilePhoto;
  Specialty? specialty;
  String? licenseNumber;
  String? aboutMe;
  double? sessionPrice;
  String? clinicAddress;
  Location? location;
  int? experienceYears;

  DoctorResponse({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.profilePhoto,
    this.specialty,
    this.licenseNumber,
    this.aboutMe,
    this.sessionPrice,
    this.clinicAddress,
    this.location,
    this.experienceYears,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) {
    return DoctorResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as dynamic,
      address: json['address'] as String?,
      profilePhoto: json['profile_photo'] as dynamic,
      specialty: json['specialty'] == null
          ? null
          : Specialty.fromJson(json['specialty'] as Map<String, dynamic>),
      licenseNumber: json['license_number'] as String?,
      aboutMe: json['about_me'] as String?,
      sessionPrice: (json['session_price'] as num?)?.toDouble(),
      clinicAddress: json['clinic_address'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      experienceYears: json['experience_years'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'address': address,
    'profile_photo': profilePhoto,
    'specialty': specialty?.toJson(),
    'license_number': licenseNumber,
    'about_me': aboutMe,
    'session_price': sessionPrice,
    'clinic_address': clinicAddress,
    'location': location?.toJson(),
    'experience_years': experienceYears,
  };

  DoctorEntity toEntity() => DoctorEntity(
    id: id ?? 0,
    name: name ?? '',
    specialty: specialty?.name ?? '',
    clinicAddress: clinicAddress ?? '',
    averageRating: 0,
  );
}
