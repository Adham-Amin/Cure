import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, List<DoctorEntity>>> getFavourite();
  Future<Either<Failure, void>> toggleFavourite({required String doctorId});
  Future<Either<Failure, bool>> checkFavourite({required String doctorId});
}
