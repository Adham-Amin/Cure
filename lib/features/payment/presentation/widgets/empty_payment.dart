import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmptyPayment extends StatelessWidget {
  const EmptyPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Image.asset(AppAssets.imagesCredit, width: 200.w),
        6.hs,
        Text(
          'Nothing to display here!',
          style: AppStyles.textRegular24.copyWith(
            fontFamily: AppStyles.fontGeorgia,
          ),
        ),
        8.hs,
        Text(
          'Add your cards to make payment easier',
          style: AppStyles.textRegular16.copyWith(color: AppColors.darkGrey),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        CustomButton(
          title: 'Add New Card',
          onTap: () => context.push(AppRoutes.addPaymentCard),
        ),
        32.hs,
      ],
    );
  }
}
