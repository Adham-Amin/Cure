import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/doctor_details/data/models/doctor_details_response/doctor_details_response.dart';
import 'package:cure/features/doctor_details/data/models/reviews_response/reviews_response.dart';

abstract class DoctorDetailsRemoteDataSource {
  Future<DoctorDetailsResponse> getDoctorDetails({required String id});
  Future<List<ReviewsResponse>> getReviews({required String id});
}

class DoctorDetailsRemoteDataSourceImpl
    implements DoctorDetailsRemoteDataSource {
  final ApiService apiService;
  DoctorDetailsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<DoctorDetailsResponse> getDoctorDetails({required String id}) async {
    final response = await apiService.get(endPoint: '/doctors/$id');
    return DoctorDetailsResponse.fromJson(response['data']);
  }

  @override
  Future<List<ReviewsResponse>> getReviews({required String id}) async {
    final response = await apiService.get(endPoint: '/reviews/doctor/$id');
    return (response['data'] as List)
        .map((e) => ReviewsResponse.fromJson(e))
        .toList();
  }
}
