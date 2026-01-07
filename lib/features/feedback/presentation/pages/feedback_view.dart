import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/booking/domain/entities/booking_entity.dart';
import 'package:cure/features/feedback/domain/repositories/feedback_repo.dart';
import 'package:cure/features/feedback/presentation/cubit/feedback_cubit.dart';
import 'package:cure/features/feedback/presentation/widgets/feedback_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key, required this.booking});

  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedbackCubit(feedbackRepo: getIt<FeedbackRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
          title: const Text('Feedback'),
        ),
        body: FeedbackViewBody(booking: booking),
      ),
    );
  }
}
