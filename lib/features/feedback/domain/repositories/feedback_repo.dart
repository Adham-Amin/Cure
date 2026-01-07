import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/feedback/data/models/feedback_request.dart';
import 'package:dartz/dartz.dart';

abstract class FeedbackRepo {
  Future<Either<Failure, void>> sendFeedback({
    required FeedbackRequest feedbackRequest,
  });
}
