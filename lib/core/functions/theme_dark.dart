import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';

ThemeData themeDark() {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppStyles.fontFamily,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.grey,
      surfaceTint: Colors.transparent,
    ),
    textTheme: TextTheme(
      bodyMedium: AppStyles.textRegular14.copyWith(color: AppColors.white),
      labelLarge: AppStyles.textRegular14.copyWith(color: AppColors.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyles.textRegular14.copyWith(color: AppColors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
      prefixIconColor: AppColors.grey,
      suffixIconColor: AppColors.grey,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
  );
}
