import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:cure/features/profile/data/models/update_profile/update_profile.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  Future<UpdateProfileModel> updateProfile({required RegisterRequest data});
  Future<void> deleteAccount();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> deleteAccount() async {
    await apiService.post(endPoint: '/delete-account');
  }

  @override
  Future<UpdateProfileModel> updateProfile({
    required RegisterRequest data,
  }) async {
    final response = await apiService.post(
      endPoint: '/updateProfile',
      data: FormData.fromMap(await data.toUpdate()),
    );
    return UpdateProfileModel.fromJson(response);
  }
}
