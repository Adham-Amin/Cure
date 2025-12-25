import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/doctor_details/domain/entities/review_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withValues(alpha: 0.15),
            offset: const Offset(0, 0),
            blurRadius: 6.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.w,
                backgroundImage: AssetImage(AppAssets.imagesReviewer),
              ),
              12.ws,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: AppStyles.textRegular16.copyWith(
                      fontFamily: AppStyles.fontGeorgia,
                    ),
                  ),
                  4.hs,
                  Text(
                    review.createdAt,
                    style: AppStyles.textRegular14.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Color(0xffF9E000).withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppAssets.svgsIcStarYellow),
                    4.ws,
                    Text(
                      review.rating.toString(),
                      style: AppStyles.textSemiBold16.copyWith(
                        color: Color(0xffF9E000),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          8.hs,
          Text(review.review, style: AppStyles.textRegular14),
        ],
      ),
    );
  }
}
