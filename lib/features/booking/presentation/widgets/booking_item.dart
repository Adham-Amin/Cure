import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/booking/presentation/widgets/booking_actions.dart';
import 'package:cure/features/booking/presentation/widgets/booking_header.dart';
import 'package:cure/features/booking/presentation/widgets/clinic_address.dart';
import 'package:cure/features/booking/presentation/widgets/doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({super.key, required this.booking, required this.image});

  final BookingEntity booking;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.lightCard),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingHeader(booking: booking),
          Divider(height: 16.h, color: AppColors.lightCard),
          GestureDetector(
            onTap: () => context.push(
              AppRoutes.doctorDetails,
              extra: {'id': booking.doctorId, 'image': image},
            ),
            child: DoctorInfo(booking: booking, image: image),
          ),
          8.hs,
          ClinicAddress(address: booking.doctorClinicAddress),
          16.hs,
          BookingActions(booking: booking),
        ],
      ),
    );
  }
}
