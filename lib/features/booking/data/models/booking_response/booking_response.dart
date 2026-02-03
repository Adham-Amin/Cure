import 'package:cure/features/booking/domain/entities/booking_entity.dart';

import 'doctor.dart';
import 'patient.dart';

class BookingResponse {
  num? id;
  Doctor? doctor;
  Patient? patient;
  String? appointmentDate;
  String? appointmentTime;
  String? status;
  num? price;
  String? paymentMethod;
  String? paymentStatus;
  String? notes;
  String? cancellationReason;
  DateTime? cancelledAt;
  DateTime? createdAt;

  BookingResponse({
    this.id,
    this.doctor,
    this.patient,
    this.appointmentDate,
    this.appointmentTime,
    this.status,
    this.price,
    this.paymentMethod,
    this.paymentStatus,
    this.notes,
    this.cancellationReason,
    this.cancelledAt,
    this.createdAt,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      id: json['id'] as num?,
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      appointmentDate: json['appointment_date'] as String?,
      appointmentTime: json['appointment_time'] as String?,
      status: json['status'] as String?,
      price: json['price'] as num?,
      paymentMethod: json['payment_method'] as String?,
      paymentStatus: json['payment_status'] as String?,
      notes: json['notes'] as String?,
      cancellationReason: json['cancellation_reason'] as String?,
      cancelledAt: json['cancelled_at'] == null
          ? null
          : DateTime.parse(json['cancelled_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'doctor': doctor?.toJson(),
    'patient': patient?.toJson(),
    'appointment_date': appointmentDate,
    'appointment_time': appointmentTime,
    'status': status,
    'price': price,
    'payment_method': paymentMethod,
    'payment_status': paymentStatus,
    'notes': notes,
    'cancellation_reason': cancellationReason,
    'cancelled_at': cancelledAt?.toIso8601String(),
    'created_at': createdAt?.toIso8601String(),
  };

  BookingEntity toEntity() =>  BookingEntity(
    id: id ?? 0,
    doctorId: doctor?.id ?? 0,
    patientId: patient?.id ?? 0,
    doctorName: doctor?.name ?? '',
    doctorSpecialty: doctor?.speciality ?? '',
    doctorClinicAddress: doctor?.address ?? '',
    dateTimeFormatted: '$appointmentDate - $appointmentTime',
    statusLabel: status ?? '',
    price: price ?? 0,
    createdAt:  createdAt.toString(),
  );
}
