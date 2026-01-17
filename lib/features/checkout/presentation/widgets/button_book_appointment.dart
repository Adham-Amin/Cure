import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/functions/navigate_to_tab.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ButtonBookAppointment extends StatelessWidget {
  const ButtonBookAppointment({
    super.key,
    required this.doctor,
    required this.selectedDate,
    required this.dateFormat,
  });

  final DoctorInfoEntity doctor;
  final String selectedDate;
  final String dateFormat;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Price', style: AppStyles.textMedium24),
              6.ws,
              Text(
                r'\hour',
                style: AppStyles.textRegular12.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
              const Spacer(),
              Text(
                '${doctor.price}\$',
                style: AppStyles.textMedium16.copyWith(color: Colors.redAccent),
              ),
            ],
          ),
          16.hs,
          BlocConsumer<BookingCubit, BookingState>(
            listener: (context, state) {
              if (state is BookingError) {
                customSnackBar(
                  context: context,
                  message: state.message,
                  type: AnimatedSnackBarType.error,
                );
              }
              if (state is BookingLoaded) {
                customSnackBar(
                  context: context,
                  message: 'Appointment Rescheduled Successfully',
                  type: AnimatedSnackBarType.success,
                );
                context.go(AppRoutes.main);
                navigateToTab(context, 0);
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is BookingLoading,
                title: 'Book Appointment',
                onTap: () {
                  if (selectedDate.isEmpty) {
                    customSnackBar(
                      context: context,
                      message: 'Please select date',
                      type: AnimatedSnackBarType.warning,
                    );
                  } else {
                    doctor.isReschedule == true
                        ? context.read<BookingCubit>().rescheduleBooking(
                            id: doctor.id.toString(),
                            date: selectedDate,
                          )
                        : context.push(
                            AppRoutes.checkout,
                            extra: DoctorInfoEntity(
                              id: doctor.id,
                              price: doctor.price,
                              image: doctor.image,
                              name: doctor.name,
                              specialty: doctor.specialty,
                              clinicAddress: doctor.clinicAddress,
                              timeAppointment: selectedDate,
                              dateTimeFormatted: dateFormat,
                            ),
                          );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
