import 'doctor.dart';
import 'patient.dart';

class Booking {
  num? id;
  String? dateTime;
  String? dateTimeFormatted;
  String? status;
  String? statusLabel;
  String? paymentMethod;
  num? price;
  Doctor? doctor;
  Patient? patient;
  bool? canCancel;
  bool? canReschedule;
  String? createdAt;
  String? updatedAt;

  Booking({
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

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json['id'] as num?,
    dateTime: json['date_time'] as String?,
    dateTimeFormatted: json['date_time_formatted'] as String?,
    status: json['status'] as String?,
    statusLabel: json['status_label'] as String?,
    paymentMethod: json['payment_method'] as String?,
    price: json['price'] as num?,
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
}
