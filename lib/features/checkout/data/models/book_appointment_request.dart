class BookAppointmentRequest {
  final num doctorId;
  final String dateTime;

  BookAppointmentRequest({required this.doctorId, required this.dateTime});

  Map<String, dynamic> toJson() => {
    'doctor_id': doctorId,
    'date_time': dateTime,
    'payment_method': "cash",
    'return_url': "https://app.example.com/stripe/return",
    'cancel_url': "https://app.example.com/stripe/cancel",
  };
}
