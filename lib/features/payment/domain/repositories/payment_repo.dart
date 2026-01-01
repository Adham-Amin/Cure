import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/payment/data/models/add_payment_request.dart';
import 'package:cure/features/payment/domain/entities/payment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentRepo {
  Future<Either<Failure, List<PaymentEntity>>> getPaymentCards();
  Future<Either<Failure, void>> addPaymentCard({
    required AddPaymentRequest card,
  });
  Future<Either<Failure, void>> deletePaymentCard({required String id});
  Future<Either<Failure, void>> setDefaultPaymentCard({required String id});
}
