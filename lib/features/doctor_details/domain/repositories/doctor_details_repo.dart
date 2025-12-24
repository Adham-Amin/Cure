import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorDetailsRepo {
  Future<Either<Failure, DoctorDetailsEntity>> getDoctorDetails({
    required String doctorId,
  });
}
