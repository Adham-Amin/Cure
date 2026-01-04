part of 'booking_cubit.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final List<BookingEntity> bookings;
  BookingLoaded({required this.bookings});
}

class BookingError extends BookingState {
  final String message;
  BookingError({required this.message});
}
