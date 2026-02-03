import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepo {
  Future<Either<Failure, List<BookingEntity>>> getBookings();
  Future<Either<Failure, void>> cancelBooking({required String id});
  Future<Either<Failure, void>> rescheduleBooking({
    required String id,
    required String appointmentDate,
    required String appointmentTime,
  });
}
