import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/booking/data/datasources/booking_remote_data_source.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/booking/domain/repositories/booking_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookingRepoImpl extends BookingRepo {
  final BookingRemoteDataSource bookingRemoteDataSource;
  BookingRepoImpl({required this.bookingRemoteDataSource});
  @override
  Future<Either<Failure, void>> cancelBooking({required String id}) async {
    try {
      await bookingRemoteDataSource.cancelBooking(id: id);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookings() async {
    try {
      final data = await bookingRemoteDataSource.getBookings();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rescheduleBooking({
    required String id,
    required String date,
  }) async {
    try {
      await bookingRemoteDataSource.rescheduleBooking(id: id, date: date);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
