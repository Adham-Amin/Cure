import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/doctor_details/data/models/doctor_details_model/doctor_details_model.dart';

abstract class DoctorDetailsRemoteDataSource {
  Future<DoctorDetailsModel> getDoctorDetails({required String id});
}

class DoctorDetailsRemoteDataSourceImpl
    implements DoctorDetailsRemoteDataSource {
  final ApiService apiService;
  DoctorDetailsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<DoctorDetailsModel> getDoctorDetails({required String id}) async {
    final response = await apiService.get(endPoint: '/doctors/$id');
    return DoctorDetailsModel.fromJson(response['data']);
  }
}
