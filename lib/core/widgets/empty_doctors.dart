import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyDoctors extends StatelessWidget {
  const EmptyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_off_outlined, color: AppColors.grey, size: 64.w),
          24.hs,
          Text('No Doctors Found', style: AppStyles.textRegular14),
        ],
      ),
    );
  }
}
