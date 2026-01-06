import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/booking/domain/repositories/booking_repo.dart';
import 'package:cure/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:cure/features/booking/presentation/widgets/booking_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookingCubit(bookingRepo: getIt<BookingRepo>())..getBookings(),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Bookings')),
        body: const BookingViewBody(),
      ),
    );
  }
}
