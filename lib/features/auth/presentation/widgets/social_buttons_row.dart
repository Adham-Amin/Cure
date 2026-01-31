import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/auth/presentation/widgets/social_button.dart';

class SocialButtonsAndOr extends StatelessWidget {
  const SocialButtonsAndOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.grey,
                indent: 32.w,
                thickness: 1.h,
              ),
            ),
            16.ws,
            Text(
              'Or',
              style: AppStyles.textMedium14.copyWith(color: AppColors.grey),
            ),
            16.ws,
            Expanded(
              child: Divider(
                color: AppColors.grey,
                endIndent: 32.w,
                thickness: 1.h,
              ),
            ),
          ],
        ),
        24.hs,
        SocialButton(
          text: 'Sign in with Google',
          iconPath: AppAssets.svgsIcGogole,
          onPressed: () {},
        ),
      ],
    );
  }
}
