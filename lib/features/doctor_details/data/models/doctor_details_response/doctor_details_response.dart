import 'location.dart';
import 'specialty.dart';

class DoctorDetailsResponse {
  num? id;
  String? name;
  String? email;
  dynamic mobile;
  String? address;
  num? patientCount;
  num? reviewsCount;
  dynamic ratingAvg;
  String? profilePhoto;
  Specialty? specialty;
  String? licenseNumber;
  String? aboutMe;
  num? sessionPrice;
  String? clinicAddress;
  Location? location;
  num? experienceYears;

  DoctorDetailsResponse({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.address,
    this.patientCount,
    this.reviewsCount,
    this.ratingAvg,
    this.profilePhoto,
    this.specialty,
    this.licenseNumber,
    this.aboutMe,
    this.sessionPrice,
    this.clinicAddress,
    this.location,
    this.experienceYears,
  });

  factory DoctorDetailsResponse.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsResponse(
      id: json['id'] as num?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as dynamic,
      address: json['address'] as String?,
      patientCount: json['patient_count'] as num?,
      reviewsCount: json['reviews_count'] as num?,
      ratingAvg: json['rating_avg'] as dynamic,
      profilePhoto: json['profile_photo'] as String?,
      specialty: json['specialty'] == null
          ? null
          : Specialty.fromJson(json['specialty'] as Map<String, dynamic>),
      licenseNumber: json['license_number'] as String?,
      aboutMe: json['about_me'] as String?,
      sessionPrice: json['session_price'] as num?,
      clinicAddress: json['clinic_address'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      experienceYears: json['experience_years'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'address': address,
    'patient_count': patientCount,
    'reviews_count': reviewsCount,
    'rating_avg': ratingAvg,
    'profile_photo': profilePhoto,
    'specialty': specialty?.toJson(),
    'license_number': licenseNumber,
    'about_me': aboutMe,
    'session_price': sessionPrice,
    'clinic_address': clinicAddress,
    'location': location?.toJson(),
    'experience_years': experienceYears,
  };
}
