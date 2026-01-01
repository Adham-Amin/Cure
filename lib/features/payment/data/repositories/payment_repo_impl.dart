import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:cure/features/payment/data/models/add_payment_request.dart';
import 'package:cure/features/payment/domain/entities/payment_entity.dart';
import 'package:cure/features/payment/domain/repositories/payment_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PaymentRepoImpl implements PaymentRepo {
  final PaymentRemoteDataSource paymentRemoteDataSource;
  PaymentRepoImpl({required this.paymentRemoteDataSource});
  @override
  Future<Either<Failure, void>> addPaymentCard({
    required AddPaymentRequest card,
  }) async {
    try {
      await paymentRemoteDataSource.addPaymentCard(card: card);
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePaymentCard({required String id}) async {
    try {
      await paymentRemoteDataSource.deletePaymentCard(id: id);
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PaymentEntity>>> getPaymentCards() async {
    try {
      final cards = await paymentRemoteDataSource.getPaymentCards();
      return Right(cards.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setDefaultPaymentCard({
    required String id,
  }) async {
    try {
      await paymentRemoteDataSource.setDefaultPaymentCard(id: id);
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
