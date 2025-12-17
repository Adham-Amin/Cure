import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SpecialtiesRepo {
  Future<Either<Failure, List<DoctorEntity>>> getDoctorBySpecialties({
    required String specialties,
  });
}
