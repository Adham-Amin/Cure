import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();
  Future<Either<Failure, List<DoctorEntity>>> getTopExperiencedDoctors();
}
