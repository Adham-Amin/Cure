import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorsRepo {
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();
  Future<Either<Failure, List<DoctorEntity>>> getDoctorsbySpecialties({
    required String specialties,
  });
}
