import 'package:flutter/material.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/intro/onbording/data/model/onbording_model.dart';

class ButtonSkip extends StatelessWidget {
  const ButtonSkip({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentPage != OnbordingModel.onbordingList.length - 1,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      child: GestureDetector(
        onTap: () {
          pageController.jumpToPage(OnbordingModel.onbordingList.length - 1);
        },
        child: Text(
          'Skip',
          style: AppStyles.textMedium16.copyWith(color: AppColors.darkGrey),
        ),
      ),
    );
  }
}
