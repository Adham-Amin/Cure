import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.imagesNotification, width: 200.w),
          24.hs,
          Text(
            'Nothing to display here!',
            style: AppStyles.textRegular24.copyWith(
              fontFamily: AppStyles.fontGeorgia,
            ),
          ),
          12.hs,
          Text(
            'We’ll notify you once we have new notifications.',
            style: AppStyles.textRegular16.copyWith(color: AppColors.darkGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
