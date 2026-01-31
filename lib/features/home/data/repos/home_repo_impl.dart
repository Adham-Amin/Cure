import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/data/data_source/home_remote_data_source.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() async {
    try {
      final data = await homeRemoteDataSource.getDoctors();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<DoctorEntity>>> getTopExperiencedDoctors() async {
    try {
      final data = await homeRemoteDataSource.getTopExperiencedDoctors();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

}
