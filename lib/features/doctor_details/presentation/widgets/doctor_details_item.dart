import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorDetailsItem extends StatelessWidget {
  const DoctorDetailsItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SvgPicture.asset(image, colorFilter: isDark ? const ColorFilter.mode(AppColors.white, BlendMode.srcIn) : null),
        12.hs,
        Text(
          title,
          style: AppStyles.textSemiBold14.copyWith(color: Color(0xff4B5563)),
        ),
        4.hs,
        Text(
          subtitle,
          style: AppStyles.textRegular14.copyWith(color: AppColors.darkGrey),
        ),
      ],
    );
  }
}
