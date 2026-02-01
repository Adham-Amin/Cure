import 'package:cure/core/errors/failure.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/features/auth/domain/entities/user_entity.dart';
import 'package:cure/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:cure/features/profile/data/models/edit_profile_request.dart';
import 'package:cure/features/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      await profileRemoteDataSource.deleteAccount();
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> editProfile({
    required EditProfileRequest data,
  }) async {
    try {
      final response = await profileRemoteDataSource.editProfile(data: data);
      await Prefs.setUser(response.toEntity());
      return Right(response.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
