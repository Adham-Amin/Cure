import 'package:cure/features/home/domain/entities/doctor_entity.dart';

import 'datum.dart';

class SpecialtiesModel {
  List<Datum>? data;

  SpecialtiesModel({this.data});

  factory SpecialtiesModel.fromJson(Map<String, dynamic> json) {
    return SpecialtiesModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
  };

  List<DoctorEntity> toEntity() =>
      data
          ?.map(
            (e) => DoctorEntity(
              id: e.id ?? 0,
              name: e.user?.name ?? '',
              specialty: e.specialty ?? '',
              clinicAddress: e.clinicAddress ?? '',
              averageRating: e.averageRating ?? 0,
            ),
          )
          .toList() ??
      [];
}
