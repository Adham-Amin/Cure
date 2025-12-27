import 'package:cure/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateNumberRepo {
  Future<Either<Failure, void>> updateNumber({required String number});
  Future<Either<Failure, void>> verifyCode({
    required String code,
    required String newNumber,
  });
}
