import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/search/data/datasources/search_remote_data_source.dart';
import 'package:cure/features/search/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors({
    required String query,
  }) async {
    try {
      final data = await searchRemoteDataSource.getDoctors(query: query);
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
