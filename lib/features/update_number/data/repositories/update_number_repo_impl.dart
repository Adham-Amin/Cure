import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/update_number/data/datasources/update_number_remote_data_source.dart';
import 'package:cure/features/update_number/domain/repositories/update_number_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UpdateNumberRepoImpl implements UpdateNumberRepo {
  final UpdateNumberRemoteDataSource updateNumberRemoteDataSource;
  UpdateNumberRepoImpl({required this.updateNumberRemoteDataSource});
  @override
  Future<Either<Failure, void>> updateNumber({required String number}) async {
    try {
      await updateNumberRemoteDataSource.updateNumber(number: number);
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
  Future<Either<Failure, void>> verifyCode({
    required String code,
    required String newNumber,
  }) async {
    try {
      await updateNumberRemoteDataSource.verifyCode(
        code: code,
        newNumber: newNumber,
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
