import 'package:cure/features/checkout/data/datasource/checkout_remote_data_source.dart';
import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/checkout/data/models/book_appointment_request.dart';
import 'package:cure/features/checkout/domain/entities/book_appointment_entity.dart';
import 'package:cure/features/checkout/domain/repo/checkout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;
  CheckoutRepoImpl({required this.checkoutRemoteDataSource});

  @override
  Future<Either<Failure, BookAppointmentEntity>> bookAppointment({
    required BookAppointmentRequest book,
  }) async {
    try {
      final response = await checkoutRemoteDataSource.bookAppointment(
        book: book,
      );
      return Right(response.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> paymentWithStripe({
    required String amount,
    required String currency,
    required String customerId,
  }) async {
    try {
      final ephermeralKeysEntity = await checkoutRemoteDataSource
          .getEphermeralkey(customerId: customerId);

      final paymentIntentsEntity = await checkoutRemoteDataSource
          .createPaymentIntent(
            amount: amount,
            currency: currency,
            customerId: customerId,
          );

      await checkoutRemoteDataSource.initPaymentSheet(
        clinicSecret: paymentIntentsEntity.clientSecret,
        ephemeralKey: ephermeralKeysEntity.ephemeralKey,
        customerId: customerId,
      );

      await checkoutRemoteDataSource.showPaymentSheet();

      return const Right(null);
    } on StripeException catch (e) {
      return Left(ServerFailure(e.error.message.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
