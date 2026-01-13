import 'package:cure/features/checkout/domain/entities/book_appointment_entity.dart';

import 'booking.dart';

class BookAppointmentResponse {
  Booking? booking;

  BookAppointmentResponse({this.booking});

  factory BookAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return BookAppointmentResponse(
      booking: json['booking'] == null
          ? null
          : Booking.fromJson(json['booking'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'booking': booking?.toJson()};

  BookAppointmentEntity toEntity() => BookAppointmentEntity(
    date: booking?.dateTimeFormatted ?? '',
    doctorName: booking?.doctor?.user?.name ?? '',
  );
}
