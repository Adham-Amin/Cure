import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showCustomDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onTap,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.r)),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyles.textRegular24.copyWith(
                fontFamily: AppStyles.fontGeorgia,
                color: AppColors.black,
              ),
            ),
            16.hs,
            const Divider(height: 1, color: AppColors.darkGrey),
            16.hs,
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.textMedium16.copyWith(color: AppColors.darkGrey),
            ),
            24.hs,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () => context.pop(),
                    child: Text(
                      'Cancel',
                      style: AppStyles.textMedium14.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
                16.ws,
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                      onTap();
                    },
                    child: Text(
                      'Yes, ${title.split(' ').first}',
                      style: AppStyles.textMedium14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
