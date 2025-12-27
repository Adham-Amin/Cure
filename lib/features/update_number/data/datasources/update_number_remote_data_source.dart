import 'package:cure/core/services/api_service.dart';
import 'package:dio/dio.dart';

abstract class UpdateNumberRemoteDataSource {
  Future<void> updateNumber({required String number});
  Future<void> verifyCode({required String code, required String newNumber});
}

class UpdateNumberRemoteDataSourceImpl implements UpdateNumberRemoteDataSource {
  final ApiService apiService;
  UpdateNumberRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> updateNumber({required String number}) async {
    await apiService.post(
      endPoint: '/mobile/request-change',
      data: {'mobile': number},
    );
  }

  @override
  Future<void> verifyCode({
    required String code,
    required String newNumber,
  }) async {
    await apiService.post(
      endPoint: '/mobile/verify-change',
      data: FormData.fromMap({'otp': code, 'new_mobile': newNumber}),
    );
  }
}
