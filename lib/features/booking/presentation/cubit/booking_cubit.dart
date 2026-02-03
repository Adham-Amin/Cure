import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/booking/domain/repositories/booking_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({required this.bookingRepo}) : super(BookingInitial());

  final BookingRepo bookingRepo;

  Future<void> getBookings() async {
    emit(BookingLoading());
    final result = await bookingRepo.getBookings();
    result.fold(
      (l) => emit(BookingError(message: l.message)),
      (r) => emit(BookingLoaded(bookings: r)),
    );
  }

  Future<void> cancelBooking({required String id}) async {
    emit(BookingLoading());
    final result = await bookingRepo.cancelBooking(id: id);
    result.fold(
      (l) => emit(BookingError(message: l.message)),
      (r) async => await getBookings(),
    );
  }

  Future<void> rescheduleBooking({
    required String id,
    required String appointmentDate,
    required String appointmentTime,
  }) async {
    emit(BookingLoading());
    final result = await bookingRepo.rescheduleBooking(id: id, appointmentDate: appointmentDate, appointmentTime: appointmentTime);
    result.fold(
      (l) => emit(BookingError(message: l.message)),
      (r) async => await getBookings(),
    );
  }
}
