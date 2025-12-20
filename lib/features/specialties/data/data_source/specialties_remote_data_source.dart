import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/specialties/data/model/specialties_model/specialties_model.dart';

abstract class SpecialtiesRemoteDataSource {
  Future<SpecialtiesModel> getDoctorBySpecialties({
    required String specialties,
  });
}

class SpecialtiesRemoteDataSourceImpl implements SpecialtiesRemoteDataSource {
  final ApiService apiService;
  SpecialtiesRemoteDataSourceImpl({required this.apiService});
  @override
  Future<SpecialtiesModel> getDoctorBySpecialties({
    required String specialties,
  }) async {
    final response = await apiService.post(
      endPoint: '/search/history?search_query=$specialties',
    );
    return SpecialtiesModel.fromJson(response);
  }
}
