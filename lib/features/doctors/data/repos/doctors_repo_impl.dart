import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/doctors/data/data_source/doctors_remote_data_source.dart';
import 'package:cure/features/doctors/domain/repo/doctor_repo.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DoctorsRepoImpl implements DoctorsRepo {
  final DoctorsRemoteDataSource doctorsRemoteDataSource;
  DoctorsRepoImpl({required this.doctorsRemoteDataSource});

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() async {
    try {
      final doctors = await doctorsRemoteDataSource.getDoctors();
      return Right(doctors);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctorsbySpecialties({
    required String specialties,
  }) async {
    try {
      final doctors = await doctorsRemoteDataSource.getDoctorsbySpecialties(
        specialties: specialties,
      );
      return Right(doctors);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
