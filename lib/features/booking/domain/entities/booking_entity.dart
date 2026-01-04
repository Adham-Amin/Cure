class BookingEntity {
  final num id;
  final String dateTimeFormatted;
  final String statusLabel;
  final String doctorName;
  final String doctorSpecialty;
  final String doctorClinicAddress;

  BookingEntity({
    required this.id,
    required this.dateTimeFormatted,
    required this.statusLabel,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorClinicAddress,
  });
}
