import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:cure/features/checkout/presentation/widgets/button_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCheckout extends StatelessWidget {
  const ButtonCheckout({
    super.key,
    required this.doctor,
    required this.indexPayment,
  });

  final DoctorInfoEntity doctor;
  final num indexPayment;

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
                '${doctor.price}\$',
                style: AppStyles.textMedium16.copyWith(color: Colors.redAccent),
              ),
            ],
          ),
          16.hs,
          ButtonPayment(indexPayment: indexPayment, doctor: doctor),
        ],
      ),
    );
  }
}
