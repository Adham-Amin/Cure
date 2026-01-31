import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/home/data/model/doctor_response/doctor_response.dart';

abstract class HomeRemoteDataSource {
  Future<List<DoctorResponse>> getDoctors();
  Future<List<DoctorResponse>> getTopExperiencedDoctors();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});
  
  @override
  Future<List<DoctorResponse>> getDoctors() async {
    final response = await apiService.get(endPoint: '/doctors');
    return (response['data'] as List).map((e) => DoctorResponse.fromJson(e)).toList();
  }
  
  @override
  Future<List<DoctorResponse>> getTopExperiencedDoctors() async {
    final response = await apiService.get(endPoint: '/doctors?sort_by=experience&sort_order=desc');
    return (response['data'] as List).map((e) => DoctorResponse.fromJson(e)).toList();
  }

}
