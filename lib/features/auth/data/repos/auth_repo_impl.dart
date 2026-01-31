import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:cure/core/errors/failure.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:cure/features/auth/domain/entities/user_entity.dart';
import 'package:cure/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, void>> verifyCode({
    required String phone,
    required String code,
  }) async {
    try {
      await authRemoteDataSource.verifyCode(phone: phone, code: code);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String phone}) async {
    try {
      await authRemoteDataSource.forgotPassword(phone: phone);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.login(
        phone: phone,
        password: password,
      );
      await Prefs.setToken(response.data?.token ?? '');
      var userInfo = await authRemoteDataSource.getUserInfo();
      await Prefs.setUser(userInfo.toEntity());
      var customStripe = await authRemoteDataSource.createCustomStripe(
        email: userInfo.email ?? '',
      );
      await Prefs.setCustomStripe(customStripe);
      return Right(userInfo.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      await authRemoteDataSource.register(registerRequest: registerRequest);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      await authRemoteDataSource.resetPassword(
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      );
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> createCustomStripe({
    required String email,
  }) async {
    try {
      final response = await authRemoteDataSource.createCustomStripe(
        email: email,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
