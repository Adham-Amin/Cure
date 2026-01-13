import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/checkout/data/models/book_appointment_request.dart';
import 'package:cure/features/checkout/domain/entities/book_appointment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, BookAppointmentEntity>> bookAppointment({
    required BookAppointmentRequest book,
  });

  Future<Either<Failure, void>> paymentWithStripe({
    required String amount,
    required String currency,
    required String customerId,
  });
}
