import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/home/data/model/doctor_response/doctor_response.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';

abstract class DoctorsRemoteDataSource {
  Future<List<DoctorEntity>> getDoctors();
}

class DoctorsRemoteDataSourceImpl implements DoctorsRemoteDataSource {
  final ApiService apiService;
  DoctorsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<DoctorEntity>> getDoctors() async {
    final response = await apiService.get(endPoint: '/doctors');
    List<DoctorEntity> doctors = [];

    for (var doctor in response['data']) {
      doctors.add(DoctorResponse.fromJson(doctor).toEntity());
    }
    return doctors;
  }
}
