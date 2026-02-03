import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:cure/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailsBottomBar extends StatelessWidget {
  const DoctorDetailsBottomBar({
    super.key,
    required this.doctor,
    required this.image,
  });

  final String image;
  final DoctorDetailsEntity doctor;

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
              Text('Price', style: AppStyles.textMedium24.copyWith(color: Colors.black)),
              6.ws,
              Text(
                r'\hour',
                style: AppStyles.textRegular12.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
              const Spacer(),
              Text(
                '${doctor.sessionPrice}\$',
                style: AppStyles.textMedium16.copyWith(color: Colors.redAccent),
              ),
            ],
          ),
          16.hs,
          CustomButton(
            title: 'Book Appointment',
            onTap: () => context.push(
              AppRoutes.bookAppointment,
              extra: DoctorInfoEntity(
                price: doctor.sessionPrice,
                id: doctor.id,
                image: image,
                name: doctor.name,
                specialty: doctor.specialty,
                clinicAddress: doctor.clinicAddress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
