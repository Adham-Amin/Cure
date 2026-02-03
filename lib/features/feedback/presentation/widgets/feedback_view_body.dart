import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/feedback/data/models/feedback_request.dart';
import 'package:cure/features/feedback/presentation/cubit/feedback_cubit.dart';
import 'package:cure/features/feedback/presentation/widgets/animated_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeedbackViewBody extends StatefulWidget {
  const FeedbackViewBody({super.key, required this.booking});

  final BookingEntity booking;

  @override
  State<FeedbackViewBody> createState() => _FeedbackViewBodyState();
}

class _FeedbackViewBodyState extends State<FeedbackViewBody> {
  int _currentRating = 3;
  final formKey = GlobalKey<FormState>();
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
      child: Form(
        key: formKey,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your feedback';
                }
                return null;
              },
            ),
            Expanded(child: 32.hs),
            BlocConsumer<FeedbackCubit, FeedbackState>(
              listener: (context, state) {
                if (state is FeedbackLoaded) {
                  customSnackBar(
                    context: context,
                    message: 'Thank you for your feedback',
                    type: AnimatedSnackBarType.success,
                  );
                  context.pop();
                }
                if (state is FeedbackError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is FeedbackLoading,
                  title: 'Send Feedback',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<FeedbackCubit>().sendFeedback(
                        feedbackRequest: FeedbackRequest(
                          bookingId: widget.booking.id,
                          rating: _currentRating,
                          comment: feedbackController.text,
                        ),
                      );
                    }
                  },
                );
              },
            ),
            32.hs,
          ],
        ),
      ),
    );
  }
}
