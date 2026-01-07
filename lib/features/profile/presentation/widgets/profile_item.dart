import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    this.color,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final Color? color;
  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.lightCard,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
        ),
        title: Text(
          title,
          style: AppStyles.textRegular16.copyWith(color: color),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.darkGrey,
          size: 20,
        ),
        onTap: onTap,
      ),
    );
  }
}
