class BookAppointmentRequest {
  int? doctorId;
  String? dateTime;

  BookAppointmentRequest({this.doctorId, this.dateTime});

  Map<String, dynamic> toJson() => {
    'doctor_id': doctorId,
    'date_time': dateTime,
    'payment_method': "cash",
    'return_url': "https://app.example.com/stripe/return",
    'cancel_url': "https://app.example.com/stripe/cancel",
  };
}
