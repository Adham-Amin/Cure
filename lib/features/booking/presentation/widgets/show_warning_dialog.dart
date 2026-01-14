import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<dynamic> showWarningDialog({
  required BuildContext context,
  required VoidCallback onTap,
}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.r)),
      child: Padding(
        padding: EdgeInsets.all(32.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppAssets.svgsWarning),
            32.hs,
            Text(
              'Warning!',
              textAlign: TextAlign.center,
              style: AppStyles.textRegular20.copyWith(
                fontFamily: AppStyles.fontGeorgia,
                color: Color(0xffFFA726),
              ),
            ),
            8.hs,
            Text(
              'Cancellation must be made at least 24 hours in advance to receive a refund',
              textAlign: TextAlign.center,
              style: AppStyles.textMedium16.copyWith(color: AppColors.darkGrey),
            ),
            32.hs,
            Text(
              'Are you sure?',
              textAlign: TextAlign.center,
              style: AppStyles.textMedium16.copyWith(color: AppColors.darkGrey),
            ),
            16.hs,
            SizedBox(
              width: 245.w,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                onPressed: onTap,
                child: Text(
                  'Yes, cancel',
                  style: AppStyles.textMedium14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
