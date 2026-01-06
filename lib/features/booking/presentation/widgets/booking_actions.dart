import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingActions extends StatelessWidget {
  const BookingActions({super.key, required this.booking});

  final BookingEntity booking;

  bool get isActive =>
      booking.statusLabel == 'Pending' || booking.statusLabel == 'Rescheduled';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: isActive ? 'Cancel' : 'Book Again',
            backgroundColor: AppColors.white,
            colorText: AppColors.primary,
            onTap: isActive
                ? () => context.read<BookingCubit>().cancelBooking(
                    id: booking.id.toString(),
                  )
                : () {},
          ),
        ),
        16.ws,
        Expanded(
          child: CustomButton(
            title: isActive ? 'Re-schedule' : 'Feedback',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
