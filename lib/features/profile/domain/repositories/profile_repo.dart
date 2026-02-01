import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/auth/domain/entities/user_entity.dart';
import 'package:cure/features/profile/data/models/edit_profile_request.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> editProfile({
    required EditProfileRequest data,
  });
  Future<Either<Failure, void>> deleteAccount();
}
