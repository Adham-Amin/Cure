import 'package:cure/features/doctor_details/domain/entities/doctor_details_entity.dart';

import 'doctor.dart';
import 'review.dart';

class DoctorDetailsModel {
  Doctor? doctor;
  num? experience;
  num? patientCount;
  dynamic aboutMe;
  num? sessionPrice;
  String? availability;
  List<Review>? reviews;

  DoctorDetailsModel({
    this.doctor,
    this.experience,
    this.patientCount,
    this.aboutMe,
    this.sessionPrice,
    this.availability,
    this.reviews,
  });

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsModel(
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      experience: json['experience'] as num?,
      patientCount: json['patient_count'] as num?,
      aboutMe: json['about_me'] as dynamic,
      sessionPrice: (json['session_price'] as num?)?.toDouble(),
      availability: json['availability'] as String?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'doctor': doctor?.toJson(),
    'experience': experience,
    'patient_count': patientCount,
    'about_me': aboutMe,
    'session_price': sessionPrice,
    'availability': availability,
    'reviews': reviews?.map((e) => e.toJson()).toList(),
  };

  DoctorDetailsEntity toEntity() => DoctorDetailsEntity(
    id: doctor?.id.toString() ?? '0',
    experience: experience ?? 0,
    totalPatient: patientCount ?? 0,
    aboutMe: aboutMe,
    sessionPrice: sessionPrice ?? 0,
    email: doctor?.user?.email ?? '',
    mobile: doctor?.user?.mobile ?? '',
    name: doctor?.user?.name ?? '',
    rating: doctor?.averageRating ?? 0,
    reviewsAvg: doctor?.reviewsCount ?? 0,
    reviews: reviews?.map((e) => e.toEntity()).toList() ?? [],
  );
}
