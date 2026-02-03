import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/doctor_details/data/datasources/doctor_details_remote_data_source.dart';
import 'package:cure/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:cure/features/doctor_details/domain/entities/review_entity.dart';
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
      final docDetailsResponse = await doctorDetailsRemoteDataSource
          .getDoctorDetails(id: doctorId);
      final reviewsResponse = await doctorDetailsRemoteDataSource.getReviews(
        id: doctorId,
      );
      return Right(
        DoctorDetailsEntity(
          id: docDetailsResponse.id ?? 0,
          reviewsAvg: reviewsResponse.length,
          totalPatient: docDetailsResponse.patientCount ?? 0,
          aboutMe: docDetailsResponse.aboutMe ?? '',
          experience: docDetailsResponse.experienceYears ?? 0,
          rating:
              double.tryParse(docDetailsResponse.ratingAvg ?? '0')?.toInt() ??
              0,
          clinicAddress: docDetailsResponse.clinicAddress ?? '',
          email: docDetailsResponse.email ?? '',
          mobile: docDetailsResponse.mobile ?? '',
          name: docDetailsResponse.name ?? '',
          specialty: docDetailsResponse.specialty?.name ?? '',
          sessionPrice: docDetailsResponse.sessionPrice ?? 0,
          reviews: reviewsResponse
              .map(
                (e) => ReviewEntity(
                  name: e.patient?.name ?? '',
                  rating: e.rating ?? 0,
                  review: e.comment ?? '',
                  createdAt: e.createdAt ?? '',
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
