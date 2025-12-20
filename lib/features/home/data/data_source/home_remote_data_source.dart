import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/home/data/model/doctor_model/doctor_model.dart';
import 'package:cure/features/home/data/model/home_model/home_model.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
  Future<List<DoctorEntity>> getDoctors();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<HomeModel> getHomeData() async {
    final response = await apiService.get(endPoint: '/');
    return HomeModel.fromJson(response['data']);
  }

  @override
  Future<List<DoctorEntity>> getDoctors() async {
    final response = await apiService.get(endPoint: '/doctors');

    final List<DoctorEntity> doctors = [];

    for (var doctor in response['data']) {
      doctors.add(DoctorModel.fromJson(doctor).toEntity());
    }
    return doctors;
  }
}
