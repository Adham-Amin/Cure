import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';

ThemeData themeLight() {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: AppStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      surface: AppColors.white,
      brightness: Brightness.light,
      surfaceTint: Colors.transparent,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.white,
      titleTextStyle: AppStyles.textRegular24.copyWith(
        fontFamily: AppStyles.fontGeorgia,
        color: AppColors.black,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: AppStyles.textRegular14.copyWith(color: AppColors.black),
      labelLarge: AppStyles.textRegular14.copyWith(color: AppColors.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightCard,
      filled: true,
      hintStyle: AppStyles.textMedium16.copyWith(color: AppColors.grey),
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
