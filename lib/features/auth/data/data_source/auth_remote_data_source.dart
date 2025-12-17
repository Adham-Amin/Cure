import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/auth/data/models/auth_response/auth_response.dart';
import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({required String email, required String password});
  Future<AuthResponse> register({required RegisterRequest registerRequest});
  Future<void> forgotPassword({required String email});
  Future<void> verifyCode({required String email, required String code});
  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
  });

  Future<void> loginWithPhone({required String phone});

  Future<AuthResponse> verifyCodeWithPhone({
    required String phone,
    required String code,
  });

  Future<String> getGoogleAuthUrl();
  Future<AuthResponse> googleLogin({required String token});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> forgotPassword({required String email}) async {
    await apiService.post(endPoint: '/forgot-password/send-otp?email=$email');
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await apiService.post(
      endPoint: '/login',
      data: FormData.fromMap({'email': email, 'password': password}),
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<AuthResponse> register({
    required RegisterRequest registerRequest,
  }) async {
    final response = await apiService.post(
      endPoint: '/register',
      data: FormData.fromMap(await registerRequest.toJson()),
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    await apiService.post(
      endPoint: '/forgot-password/reset',
      data: FormData.fromMap({
        "email": email,
        "otp": "1234",
        "password": password,
      }),
    );
  }

  @override
  Future<void> verifyCode({required String email, required String code}) async {
    await apiService.post(
      endPoint: '/forgot-password/verify-otp',
      data: FormData.fromMap({'email': email, 'otp': '1234'}),
    );
  }

  @override
  Future<void> loginWithPhone({required String phone}) async {
    await apiService.post(
      endPoint: '/sendOtpFormobileLogin',
      data: FormData.fromMap({'mobile': phone}),
    );
  }

  @override
  Future<AuthResponse> verifyCodeWithPhone({
    required String phone,
    required String code,
  }) async {
    final response = await apiService.post(
      endPoint: '/verifyOtpForMobileLogin',
      data: FormData.fromMap({'mobile': phone, 'otp': '1234'}),
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<String> getGoogleAuthUrl() async {
    final response = await apiService.get(endPoint: '/google-auth-url');
    return response['data']['url'];
  }

  @override
  Future<AuthResponse> googleLogin({required String token}) async {
    final response = await apiService.post(
      endPoint: '/google-login',
      data: {'token': token},
    );
    return AuthResponse.fromJson(response);
  }
}
