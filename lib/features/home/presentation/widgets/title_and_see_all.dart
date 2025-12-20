import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleAndSeeAll extends StatelessWidget {
  const TitleAndSeeAll({super.key, this.onTap, required this.title});

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.textRegular20.copyWith(
            fontFamily: AppStyles.fontGeorgia,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'View all',
            style: AppStyles.textRegular14.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
