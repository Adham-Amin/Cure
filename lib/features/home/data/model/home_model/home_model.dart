import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/home/domain/entities/home_entity.dart';

import 'doctors_near_you.dart';
import 'specialty.dart';
import 'user.dart';

class HomeModel {
  User? user;
  List<Specialty>? specialties;
  List<DoctorsNearYou>? doctorsNearYou;

  HomeModel({this.user, this.specialties, this.doctorsNearYou});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      specialties: (json['specialties'] as List<dynamic>?)
          ?.map((e) => Specialty.fromJson(e as Map<String, dynamic>))
          .toList(),
      doctorsNearYou: (json['doctors_near_you'] as List<dynamic>?)
          ?.map((e) => DoctorsNearYou.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'user': user?.toJson(),
    'specialties': specialties?.map((e) => e.toJson()).toList(),
    'doctors_near_you': doctorsNearYou?.map((e) => e.toJson()).toList(),
  };

  HomeEntity toEntity() => HomeEntity(
    greeting: user?.greeting ?? '',
    address: user?.location?.address ?? '',
    specialities: specialties?.map((e) => e.name!).toList() ?? [],
    doctors:
        doctorsNearYou
            ?.map(
              (e) => DoctorEntity(
                id: e.id ?? 0,
                name: e.name ?? '',
                specialty: e.specialty ?? '',
                clinicAddress: e.clinicAddress ?? '',
                averageRating: e.averageRating ?? 0,
              ),
            )
            .toList() ??
        [],
  );
}
