import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:cure/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> updateProfile({
    required RegisterRequest data,
  });
  Future<Either<Failure, void>> deleteAccount();
}
