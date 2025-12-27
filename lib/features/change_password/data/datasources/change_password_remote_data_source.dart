import 'package:cure/core/services/api_service.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:dio/dio.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}

class ChangePasswordRemoteDataSourceImpl
    implements ChangePasswordRemoteDataSource {
  final ApiService apiService;

  ChangePasswordRemoteDataSourceImpl({required this.apiService});
  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await apiService.post(
      endPoint: '/forgot-password/reset',
      data: FormData.fromMap({
        'email': Prefs.getUser()!.email,
        'otp': '1234',
        'password': newPassword,
      }),
    );
  }
}
