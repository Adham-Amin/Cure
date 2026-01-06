import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/feedback/presentation/widgets/animated_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedbackViewBody extends StatefulWidget {
  const FeedbackViewBody({super.key});

  @override
  State<FeedbackViewBody> createState() => _FeedbackViewBodyState();
}

class _FeedbackViewBodyState extends State<FeedbackViewBody> {
  int _currentRating = 3;

  late TextEditingController feedbackController;

  @override
  void initState() {
    feedbackController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.hs,
          Text('Your Rate', style: AppStyles.textMedium22),
          10.hs,
          Row(
            children: [
              AnimatedRating(
                initialRating: _currentRating,
                acticeIcon: AppAssets.svgsIcStarYellow,
                inActiveIcon: AppAssets.svgsIcStar,
                onChanged: (value) {
                  setState(() {
                    _currentRating = value;
                  });
                },
              ),
              Spacer(),
              Text(
                '$_currentRating/5',
                style: AppStyles.textMedium30.copyWith(
                  fontFamily: AppStyles.fontGeorgia,
                ),
              ),
            ],
          ),
          24.hs,
          Text('Your Feedback', style: AppStyles.textMedium22),
          16.hs,
          CustomTextFormField(
            hintText: 'Write your feedback',
            maxLines: 8,
            controller: feedbackController,
            keyboardType: TextInputType.multiline,
          ),
          Expanded(child: 32.hs),
          CustomButton(title: 'Send Feedback', onTap: () {}),
          32.hs,
        ],
      ),
    );
  }
}
