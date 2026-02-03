class BookAppointmentRequest {
  final num doctorId;
  final String appointmentDate;
  final String appointmentTime;

  BookAppointmentRequest({
    required this.doctorId,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  Map<String, dynamic> toJson() => {
    "doctor_id": doctorId,
    "appointment_date": appointmentDate,
    "appointment_time": appointmentTime,
    "payment_method": "stripe",
    "notes": "",
  };
}
