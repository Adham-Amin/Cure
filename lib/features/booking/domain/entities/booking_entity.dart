class BookingEntity {
  final num id;
  final num doctorId;
  final num patientId;
  final String dateTimeFormatted;
  final String statusLabel;
  final String doctorName;
  final String doctorSpecialty;
  final String doctorClinicAddress;

  BookingEntity({
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
