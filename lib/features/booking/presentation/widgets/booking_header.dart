import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key, required this.booking});

  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.svgsCalendar),
        8.ws,
        Text(
          booking.dateTimeFormatted,
          style: AppStyles.textRegular12.copyWith(color: AppColors.darkGrey),
        ),
        const Spacer(),
        Text(
          booking.statusLabel,
          style: AppStyles.textRegular14.copyWith(
            color: booking.statusLabel == 'cancelled'
                ? Colors.red
                : booking.statusLabel == 'confirmed'
                ? Colors.green
                : AppColors.primary,
          ),
        ),
      ],
    );
  }
}
