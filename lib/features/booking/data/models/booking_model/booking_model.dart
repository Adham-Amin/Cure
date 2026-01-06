import 'package:cure/features/booking/domain/entities/booking_entity.dart';

import 'doctor.dart';
import 'patient.dart';

class BookingModel {
  int? id;
  String? dateTime;
  String? dateTimeFormatted;
  String? status;
  String? statusLabel;
  String? paymentMethod;
  double? price;
  Doctor? doctor;
  Patient? patient;
  bool? canCancel;
  bool? canReschedule;
  String? createdAt;
  String? updatedAt;

  BookingModel({
    this.id,
    this.dateTime,
    this.dateTimeFormatted,
    this.status,
    this.statusLabel,
    this.paymentMethod,
    this.price,
    this.doctor,
    this.patient,
    this.canCancel,
    this.canReschedule,
    this.createdAt,
    this.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json['id'] as int?,
    dateTime: json['date_time'] as String?,
    dateTimeFormatted: json['date_time_formatted'] as String?,
    status: json['status'] as String?,
    statusLabel: json['status_label'] as String?,
    paymentMethod: json['payment_method'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    doctor: json['doctor'] == null
        ? null
        : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
    patient: json['patient'] == null
        ? null
        : Patient.fromJson(json['patient'] as Map<String, dynamic>),
    canCancel: json['can_cancel'] as bool?,
    canReschedule: json['can_reschedule'] as bool?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date_time': dateTime,
    'date_time_formatted': dateTimeFormatted,
    'status': status,
    'status_label': statusLabel,
    'payment_method': paymentMethod,
    'price': price,
    'doctor': doctor?.toJson(),
    'patient': patient?.toJson(),
    'can_cancel': canCancel,
    'can_reschedule': canReschedule,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  BookingEntity toEntity() => BookingEntity(
    id: id ?? 0,
    dateTimeFormatted: dateTimeFormatted ?? 'Mon, Jun 21 - 10:00 AM',
    statusLabel: statusLabel ?? 'Pending',
    doctorClinicAddress: doctor?.clinicAddress ?? '123, Main Street, New York',
    doctorName: doctor?.user?.name ?? 'Adham Amin',
    doctorSpecialty: doctor?.specialty ?? 'Dentist',
    doctorId: doctor?.id ?? 0,
    patientId: patient?.id ?? 0,
  );
}
