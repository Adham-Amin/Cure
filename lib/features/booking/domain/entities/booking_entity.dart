class BookingEntity {
  final num id;
  final num doctorId;
  final num patientId;
  final num price;
  final String dateTimeFormatted;
  final String statusLabel;
  final String doctorName;
  final String doctorSpecialty;
  final String doctorClinicAddress;
  final String createdAt;

  BookingEntity({
    required this.createdAt,
    required this.price,
    required this.doctorId,
    required this.patientId,
    required this.id,
    required this.dateTimeFormatted,
    required this.statusLabel,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorClinicAddress,
  });
}
