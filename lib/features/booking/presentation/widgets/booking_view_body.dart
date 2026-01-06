import 'package:cure/core/widgets/custom_error.dart';
import 'package:cure/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:cure/features/booking/presentation/widgets/booking_list.dart';
import 'package:cure/features/booking/presentation/widgets/booking_loading_list.dart';
import 'package:cure/features/booking/presentation/widgets/empty_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingViewBody extends StatelessWidget {
  const BookingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return const BookingLoadingList();
          }
          if (state is BookingLoaded) {
            return state.bookings.isEmpty
                ? const EmptyBooking()
                : BookingList(bookings: state.bookings);
          }
          if (state is BookingError) {
            return CustomError(message: state.message);
          }
          return const EmptyBooking();
        },
      ),
    );
  }
}
