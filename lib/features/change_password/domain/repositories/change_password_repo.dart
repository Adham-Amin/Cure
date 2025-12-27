import 'package:cure/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
