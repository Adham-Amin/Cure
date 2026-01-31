import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:dartz/dartz.dart';
import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> login({
    required String phone,
    required String password,
  });
  Future<Either<Failure, void>> register({
    required RegisterRequest registerRequest,
  });

  Future<Either<Failure, String>> createCustomStripe({required String email});
  Future<Either<Failure, void>> forgotPassword({required String phone});
  Future<Either<Failure, void>> verifyCode({
    required String phone,
    required String code,
  });
  Future<Either<Failure, void>> resetPassword({
    required String phone,
    required String password,
    required String confirmPassword,
  });
}
