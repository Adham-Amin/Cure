import 'location.dart';
import 'user.dart';

class Datum {
  int? id;
  String? specialty;
  String? licenseNumber;
  String? clinicAddress;
  Location? location;
  num? sessionPrice;
  int? averageRating;
  int? reviewsCount;
  String? availability;
  String? consultation;
  User? user;

  Datum({
    this.id,
    this.specialty,
    this.licenseNumber,
    this.clinicAddress,
    this.location,
    this.sessionPrice,
    this.averageRating,
    this.reviewsCount,
    this.availability,
    this.consultation,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    availability: json['availability'] == null
        ? null
        : json['availability']['monday']['09:00'] as String,
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
    'availability': availability,
    'consultation': consultation,
    'user': user?.toJson(),
  };
}
