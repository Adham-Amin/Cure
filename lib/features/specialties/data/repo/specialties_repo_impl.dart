import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/specialties/data/data_source/specialties_remote_data_source.dart';
import 'package:cure/features/specialties/domain/repo/specialties_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SpecialtiesRepoImpl implements SpecialtiesRepo {
  final SpecialtiesRemoteDataSource specialtiesRemoteDataSource;
  SpecialtiesRepoImpl({required this.specialtiesRemoteDataSource});
  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctorBySpecialties({
    required String specialties,
  }) async {
    try {
      final data = await specialtiesRemoteDataSource.getDoctorBySpecialties(
        specialties: specialties,
      );
      return Right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
