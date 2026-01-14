import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({super.key, required this.title, required this.selected});

  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : AppColors.lightCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: AppStyles.textRegular16.copyWith(
          color: selected ? Colors.white : AppColors.black,
        ),
      ),
    );
  }
}
