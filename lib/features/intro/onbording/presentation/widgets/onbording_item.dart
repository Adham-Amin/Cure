import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/intro/onbording/data/model/onbording_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingItem extends StatelessWidget {
  const OnbordingItem({
    super.key,
    required this.item,
    required this.pageController,
  });

  final OnbordingModel item;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.hs,
        Image.asset(item.image, fit: BoxFit.cover, height: 315.w),
        48.hs,
        Text(
          item.title,
          style: AppStyles.textSemiBold24,
          textAlign: TextAlign.center,
        ),
        16.hs,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46),
          child: Text(
            item.description,
            style: AppStyles.textMedium16.copyWith(color: AppColors.darkGrey),
            textAlign: TextAlign.center,
          ),
        ),
        24.hs,
        SmoothPageIndicator(
          controller: pageController,
          count: OnbordingModel.onbordingList.length,
          effect: ExpandingDotsEffect(
            dotWidth: 15.w,
            dotHeight: 8.h,
            expansionFactor: 2.5,
            dotColor: AppColors.grey,
            activeDotColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
