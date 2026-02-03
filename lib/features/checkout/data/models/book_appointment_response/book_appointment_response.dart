import 'package:cure/features/checkout/domain/entities/book_appointment_entity.dart';

import 'doctor.dart';
import 'patient.dart';

class BookAppointmentResponse {
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
  dynamic cancellationReason;
  dynamic cancelledAt;
  DateTime? createdAt;

  BookAppointmentResponse({
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

  factory BookAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return BookAppointmentResponse(
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
      cancellationReason: json['cancellation_reason'] as dynamic,
      cancelledAt: json['cancelled_at'] as dynamic,
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
    'cancelled_at': cancelledAt,
    'created_at': createdAt?.toIso8601String(),
  };

  BookAppointmentEntity toEntity() => BookAppointmentEntity(
    date: '${appointmentDate ?? ''} ${appointmentTime ?? ''}',
    doctorName: doctor?.name ?? '',
  );
}
