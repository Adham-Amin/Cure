class DoctorInfoEntity {
  final num id;
  final String image;
  final String name;
  final String specialty;
  final String clinicAddress;
  final num price;

  DoctorInfoEntity({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.specialty,
    required this.clinicAddress,
  });
}
