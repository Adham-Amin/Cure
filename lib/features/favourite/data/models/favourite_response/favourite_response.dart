import 'package:cure/features/home/domain/entities/doctor_entity.dart';

import 'doctor.dart';

class FavouriteResponse {
  num? id;
  num? patientId;
  num? doctorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Doctor? doctor;

  FavouriteResponse({
    this.id,
    this.patientId,
    this.doctorId,
    this.createdAt,
    this.updatedAt,
    this.doctor,
  });

  factory FavouriteResponse.fromJson(Map<String, dynamic> json) {
    return FavouriteResponse(
      id: json['id'] as num?,
      patientId: json['patient_id'] as num?,
      doctorId: json['doctor_id'] as num?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'patient_id': patientId,
    'doctor_id': doctorId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'doctor': doctor?.toJson(),
  };

  DoctorEntity toEntity() => DoctorEntity(
    id: doctor?.id ?? 0,
    name: 'Doctor',
    specialty: 'General Practitioner',
    clinicAddress: doctor?.clinicAddress ?? '',
    averageRating: 0,
  );
}
