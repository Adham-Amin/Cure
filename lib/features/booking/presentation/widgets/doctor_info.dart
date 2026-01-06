import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, required this.booking, required this.image});

  final BookingEntity booking;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 24.w, backgroundImage: AssetImage(image)),
        12.ws,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.doctorName,
              style: AppStyles.textRegular16.copyWith(
                fontFamily: AppStyles.fontGeorgia,
              ),
            ),
            4.hs,
            Text(
              booking.doctorSpecialty,
              style: AppStyles.textRegular14.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
