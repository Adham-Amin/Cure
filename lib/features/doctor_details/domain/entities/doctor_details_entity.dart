import 'package:cure/features/doctor_details/domain/entities/review_entity.dart';

class DoctorDetailsEntity {
  final num id;
  final String name;
  final String email;
  final String mobile;
  final String specialty;
  final String clinicAddress;
  final num experience;
  final num totalPatient;
  final num rating;
  final num reviewsAvg;
  final num sessionPrice;
  final String aboutMe;
  final List<ReviewEntity> reviews;

  DoctorDetailsEntity({
    required this.id,
    required this.name,
    required this.specialty,
    required this.clinicAddress,
    required this.email,
    required this.mobile,
    required this.experience,
    required this.totalPatient,
    required this.rating,
    required this.reviewsAvg,
    required this.sessionPrice,
    required this.aboutMe,
    required this.reviews,
  });
}
