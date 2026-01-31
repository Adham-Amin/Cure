import 'package:cure/core/services/api_service.dart';
import 'package:cure/core/utils/app_keys.dart';
import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:cure/features/auth/data/models/responses/auth_response/auth_response.dart';
import 'package:cure/features/auth/data/models/responses/user_info_response/user_info_response.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({required String phone, required String password});
  Future<void> register({required RegisterRequest registerRequest});
  Future<String> createCustomStripe({required String email});
  Future<void> forgotPassword({required String phone});
  Future<void> verifyCode({required String phone, required String code});
  Future<void> resetPassword({
    required String phone,
    required String password,
    required String confirmPassword,
  });
  Future<UserInfoResponse> getUserInfo();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> forgotPassword({required String phone}) async {
    await apiService.post(
      endPoint: '/auth/forget-password',
      data: {'phone': phone},
    );
  }

  @override
  Future<AuthResponse> login({
    required String phone,
    required String password,
  }) async {
    final response = await apiService.post(
      endPoint: '/auth/login',
      data: FormData.fromMap({'phone': phone, 'password': password}),
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<void> register({required RegisterRequest registerRequest}) async {
    await apiService.post(
      endPoint: '/auth/register',
      data: FormData.fromMap(registerRequest.toJson()),
    );
  }

  @override
  Future<void> resetPassword({
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    await apiService.put(
      endPoint: '/auth/reset-password',
      data: {
        "phone": phone,
        "new_password": password,
        "new_password_confirmation": confirmPassword,
      },
    );
  }

  @override
  Future<void> verifyCode({required String phone, required String code}) async {
    await apiService.post(
      endPoint: '/auth/verify-otp',
      data: FormData.fromMap({'phone': phone, 'otp': '1234'}),
    );
  }

  @override
  Future<String> createCustomStripe({required String email}) async {
    final response = await apiService.post(
      baseUrl: 'https://api.stripe.com/v1',
      endPoint: '/customers',
      data: {'email': email},
      options: Options(
        headers: {
          'Authorization': "Bearer ${AppKeys.stripeSecreteKey}",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );
    return response['id'];
  }

  @override
  Future<UserInfoResponse> getUserInfo() async {
    final response = await apiService.get(endPoint: '/profile/show');
    return UserInfoResponse.fromJson(response['data']);
  }
}
