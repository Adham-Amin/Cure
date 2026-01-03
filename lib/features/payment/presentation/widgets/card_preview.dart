import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPreview extends StatelessWidget {
  const CardPreview({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expMonth,
    required this.expYear,
  });

  final String cardNumber;
  final String cardHolder;
  final String expMonth;
  final String expYear;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.imagesCard,
          height: 234.h,
          width: double.infinity,
        ),
        Positioned(
          top: 88.h,
          left: 28.w,
          child: Text(
            cardNumber,
            style: AppStyles.textSemiBold24.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 24.h,
          left: 28.w,
          child: Text(
            cardHolder,
            style: AppStyles.textMedium24.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 24.h,
          right: 28.w,
          child: Text(
            expMonth.isEmpty && expYear.isEmpty ? '' : '$expMonth/$expYear',
            style: AppStyles.textSemiBold24.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
