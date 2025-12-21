import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/favourite/data/datasources/favourite_remote_data_source.dart';
import 'package:cure/features/favourite/domain/repositories/favourite_repo.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final FavouriteRemoteDataSource favouriteRemoteDataSource;
  FavouriteRepoImpl({required this.favouriteRemoteDataSource});

  @override
  Future<Either<Failure, bool>> checkFavourite({
    required String doctorId,
  }) async {
    try {
      final data = await favouriteRemoteDataSource.checkFavourite(
        doctorId: doctorId,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getFavourite() async {
    try {
      final data = await favouriteRemoteDataSource.getFavourite();
      return Right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> toggleFavourite({
    required String doctorId,
  }) async {
    try {
      final data = await favouriteRemoteDataSource.toggleFavourite(
        doctorId: doctorId,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
