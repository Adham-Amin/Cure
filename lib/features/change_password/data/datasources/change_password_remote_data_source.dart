import 'package:cure/core/services/api_service.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String newConfirmPassword,
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
    required String newConfirmPassword,
  }) async {
    await apiService.put(
      endPoint: '/profile/change-password',
      data: {
        "current_password": oldPassword,
        "new_password": newPassword,
        "new_password_confirmation": newConfirmPassword,
      },
    );
  }
}
