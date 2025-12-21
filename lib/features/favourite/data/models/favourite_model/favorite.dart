import 'package:cure/features/home/domain/entities/doctor_entity.dart';

import 'location.dart';
import 'user.dart';

class Favorite {
  int? id;
  String? specialty;
  String? licenseNumber;
  String? clinicAddress;
  Location? location;
  double? sessionPrice;
  int? averageRating;
  int? reviewsCount;
  String? consultation;
  User? user;

  Favorite({
    this.id,
    this.specialty,
    this.licenseNumber,
    this.clinicAddress,
    this.location,
    this.sessionPrice,
    this.averageRating,
    this.reviewsCount,
    this.consultation,
    this.user,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    id: json['id'] as int?,
    specialty: json['specialty'] as String?,
    licenseNumber: json['license_number'] as String?,
    clinicAddress: json['clinic_address'] as String?,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    sessionPrice: (json['session_price'] as num?)?.toDouble(),
    averageRating: json['average_rating'] as int?,
    reviewsCount: json['reviews_count'] as int?,
    consultation: json['consultation'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'specialty': specialty,
    'license_number': licenseNumber,
    'clinic_address': clinicAddress,
    'location': location?.toJson(),
    'session_price': sessionPrice,
    'average_rating': averageRating,
    'reviews_count': reviewsCount,
    'consultation': consultation,
    'user': user?.toJson(),
  };

  DoctorEntity toEntity() => DoctorEntity(
    id: user?.id ?? 0,
    name: user?.name ?? '',
    specialty: specialty ?? '',
    clinicAddress: clinicAddress ?? '',
    averageRating: averageRating ?? 0,
  );
}
