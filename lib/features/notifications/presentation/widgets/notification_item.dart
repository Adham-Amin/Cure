import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      color: AppColors.lightCard,
      child: Row(
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: AppColors.pending,
            child: SvgPicture.asset(AppAssets.svgsIcPending),
          ),
          12.ws,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Upcoming Appointment',
                      style: AppStyles.textRegular16.copyWith(
                        fontFamily: AppStyles.fontGeorgia,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1h',
                      style: AppStyles.textRegular14.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
                4.hs,
                Text(
                  'Reminder: You have an appointment with...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
