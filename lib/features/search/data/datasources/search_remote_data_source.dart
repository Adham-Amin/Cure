import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/home/data/model/doctor_response/doctor_response.dart';

abstract class SearchRemoteDataSource {
  Future<List<DoctorResponse>> getDoctors({required String query});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService apiService;
  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<DoctorResponse>> getDoctors({required String query}) async {
    final response = await apiService.get(endPoint: '/doctors?search=$query');
    return (response['data'] as List)
        .map((e) => DoctorResponse.fromJson(e))
        .toList();
  }
}
