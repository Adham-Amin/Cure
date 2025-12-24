import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/doctor_details/data/datasources/doctor_details_remote_data_source.dart';
import 'package:cure/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:cure/features/doctor_details/domain/repositories/doctor_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DoctorDetailsRepoImpl implements DoctorDetailsRepo {
  final DoctorDetailsRemoteDataSource doctorDetailsRemoteDataSource;
  DoctorDetailsRepoImpl({required this.doctorDetailsRemoteDataSource});

  @override
  Future<Either<Failure, DoctorDetailsEntity>> getDoctorDetails({
    required String doctorId,
  }) async {
    try {
      final response = await doctorDetailsRemoteDataSource.getDoctorDetails(
        id: doctorId,
      );
      return Right(response.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
