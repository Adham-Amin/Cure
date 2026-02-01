import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/profile/data/models/edit_profile_request.dart';
import 'package:cure/features/profile/data/models/edit_profile_response/edit_profile_response.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  Future<EditProfileResponse> editProfile({required EditProfileRequest data});
  Future<void> deleteAccount();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> deleteAccount() async {
    await apiService.post(endPoint: '/profile/delete');
  }

  @override
  Future<EditProfileResponse> editProfile({
    required EditProfileRequest data,
  }) async {
    final formData = FormData.fromMap(await data.toJson());
    final response = await apiService.post(
      endPoint: '/profile/edit',
      data: formData,
    );
    return EditProfileResponse.fromJson(response);
  }
}
