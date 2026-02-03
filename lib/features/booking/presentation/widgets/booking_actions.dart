import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:cure/features/booking/presentation/widgets/show_warning_dialog.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookingActions extends StatelessWidget {
  const BookingActions({super.key, required this.booking, required this.image});

  final BookingEntity booking;
  final String image;

  bool get isActive =>
      booking.statusLabel == 'pending' || booking.statusLabel == 'rescheduled';

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
                ? () => showWarningDialog(
                    context: context,
                    onTap: () {
                      context.read<BookingCubit>().cancelBooking(
                        id: booking.id.toString(),
                      );
                      context.pop();
                    },
                  )
                : () {
                    context.push(
                      AppRoutes.doctorDetails,
                      extra: {'id': booking.doctorId, 'image': image},
                    );
                  },
          ),
        ),
        16.ws,
        Expanded(
          child: CustomButton(
            title: isActive ? 'Re-schedule' : 'Feedback',
            onTap: isActive
                ? () {
                    context.push(
                      AppRoutes.bookAppointment,
                      extra: DoctorInfoEntity(
                        isReschedule: true,
                        id: booking.doctorId,
                        rescheduleId: booking.id.toString(),
                        price: booking.price,
                        image: image,
                        name: booking.doctorName,
                        specialty: booking.doctorSpecialty,
                        clinicAddress: booking.doctorClinicAddress,
                      ),
                    );
                  }
                : () => context.push(AppRoutes.feedback, extra: booking),
          ),
        ),
      ],
    );
  }
}
