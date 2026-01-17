class DoctorInfoEntity {
  final num id;
  final String image;
  final String name;
  final String specialty;
  final String clinicAddress;
  final num price;
  String? timeAppointment;
  String? dateTimeFormatted;
  bool? isReschedule;

  DoctorInfoEntity({
    required this.id,
    this.isReschedule = false,
    this.dateTimeFormatted,
    required this.price,
    required this.image,
    required this.name,
    required this.specialty,
    required this.clinicAddress,
    this.timeAppointment,
  });
}
