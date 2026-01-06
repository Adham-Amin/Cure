import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyBooking extends StatelessWidget {
  const EmptyBooking({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.book_outlined, color: AppColors.grey, size: 64.w),
          24.hs,
          Text('No Bookings Found', style: AppStyles.textRegular20),
          8.hs,
          Text(
            'You have not made any bookings yet',
            style: AppStyles.textRegular14.copyWith(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
