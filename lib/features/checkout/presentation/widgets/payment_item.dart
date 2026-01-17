import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.indexPayment,
    required this.isSelected,
    required this.title,
    required this.index,
    this.icon,
  });

  final Function(int) indexPayment;
  final bool isSelected;
  final String title;
  final String? icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => indexPayment(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffEDF7EE) : AppColors.lightCard,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Checkbox(
              side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide.none,
              ),
              value: isSelected,
              checkColor: AppColors.white,
              activeColor: const Color(0xff4CAF50),
              onChanged: (_) => indexPayment(index),
            ),
            Text(
              title,
              style: AppStyles.textRegular16.copyWith(
                color: isSelected ? const Color(0xff4CAF50) : AppColors.black,
              ),
            ),
            const Spacer(),
            icon != null
                ? SvgPicture.asset(icon!, height: 40.w)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
