import 'package:cure/features/home/domain/entities/doctor_entity.dart';

class HomeEntity {
  final String greeting;
  final String address;
  List<String> specialities;
  List<DoctorEntity> doctors;
  HomeEntity({
    required this.greeting,
    required this.address,
    required this.specialities,
    required this.doctors,
  });
}
