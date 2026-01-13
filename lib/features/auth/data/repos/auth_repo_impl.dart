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
    required String email,
    required String code,
  }) async {
    try {
      await authRemoteDataSource.verifyCode(email: email, code: code);
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
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await authRemoteDataSource.forgotPassword(email: email);
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
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.login(
        email: email,
        password: password,
      );
      var customStripe = await authRemoteDataSource.createCustomStripe(
        email: email,
      );
      await Prefs.setCustomStripe(customStripe);
      await Prefs.setToken(response.token!);
      await Prefs.setUser(response.toEntity());
      return Right(response.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      var data = await authRemoteDataSource.register(
        registerRequest: registerRequest,
      );
      var customStripe = await authRemoteDataSource.createCustomStripe(
        email: registerRequest.email ?? '',
      );
      await Prefs.setCustomStripe(customStripe);
      await Prefs.setToken(data.token!);
      await Prefs.setUser(data.toEntity());
      return Right(data.toEntity());
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
    required String email,
    required String code,
    required String password,
  }) async {
    try {
      await authRemoteDataSource.resetPassword(
        email: email,
        code: code,
        password: password,
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
  Future<Either<Failure, void>> loginWithPhone({required String phone}) async {
    try {
      await authRemoteDataSource.loginWithPhone(phone: phone);
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
  Future<Either<Failure, UserEntity>> verifyCodeWithPhone({
    required String phone,
    required String code,
  }) async {
    try {
      final response = await authRemoteDataSource.verifyCodeWithPhone(
        phone: phone,
        code: code,
      );
      await Prefs.setToken(response.token!);
      await Prefs.setUser(response.toEntity());
      return Right(response.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> getGoogleAuthUrl() async {
    try {
      final url = await authRemoteDataSource.getGoogleAuthUrl();
      return Right(url);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> googleLogin({
    required String token,
  }) async {
    try {
      final response = await authRemoteDataSource.googleLogin(token: token);
      await Prefs.setUser(response.toEntity());
      return Right(response.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
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
