import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/doctor_details/domain/entities/review_entity.dart';
import 'package:cure/features/doctor_details/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
    required this.reviews,
    required this.rating,
    required this.reviewsCount,
  });

  final List<ReviewEntity> reviews;
  final num rating;
  final num reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Reviews and Rating',
              style: AppStyles.textRegular20.copyWith(
                fontFamily: AppStyles.fontGeorgia,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(AppAssets.svgsIcPen),
            8.ws,
            Text(
              'Add Review',
              style: AppStyles.textRegular14.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        16.hs,
        Row(
          children: [
            Text(
              '$rating/5',
              style: AppStyles.textRegular14.copyWith(
                fontFamily: AppStyles.fontGeorgia,
                fontSize: 40,
              ),
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: List.generate(
                    rating.toInt(),
                    (index) => SvgPicture.asset(AppAssets.svgsIcStarYellow),
                  ),
                ),
                4.hs,
                Text('$reviewsCount+ Reviews', style: AppStyles.textRegular16),
              ],
            ),
          ],
        ),
        24.hs,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reviews.length,
          separatorBuilder: (context, index) => 16.hs,
          itemBuilder: (context, index) => ReviewCard(review: reviews[index]),
        ),
      ],
    );
  }
}
