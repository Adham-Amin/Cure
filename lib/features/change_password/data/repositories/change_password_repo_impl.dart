import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/change_password/data/datasources/change_password_remote_data_source.dart';
import 'package:cure/features/change_password/domain/repositories/change_password_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChangePasswordRepoImpl extends ChangePasswordRepo {
  final ChangePasswordRemoteDataSource changePasswordRemoteDataSource;
  ChangePasswordRepoImpl({required this.changePasswordRemoteDataSource});
  @override
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String newConfirmPassword,
  }) async {
    try {
      await changePasswordRemoteDataSource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        newConfirmPassword: newConfirmPassword,
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
}
