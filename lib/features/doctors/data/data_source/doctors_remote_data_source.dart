import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/home/data/model/doctor_model/doctor_model.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';

abstract class DoctorsRemoteDataSource {
  Future<List<DoctorEntity>> getDoctors();
  Future<List<DoctorEntity>> getDoctorsbySpecialties({
    required String specialties,
  });
}

class DoctorsRemoteDataSourceImpl implements DoctorsRemoteDataSource {
  final ApiService apiService;
  DoctorsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<DoctorEntity>> getDoctors() async {
    final response = await apiService.get(endPoint: '/doctors');
    List<DoctorEntity> doctors = [];

    for (var doctor in response['data']) {
      doctors.add(DoctorModel.fromJson(doctor).toEntity());
    }
    return doctors;
  }

  @override
  Future<List<DoctorEntity>> getDoctorsbySpecialties({
    required String specialties,
  }) async {
    final response = await apiService.get(
      endPoint: '/search/history?search_query=$specialties',
    );
    List<DoctorEntity> doctors = [];

    for (var doctor in response['data']) {
      doctors.add(DoctorModel.fromJson(doctor).toEntity());
    }
    return doctors;
  }
}
