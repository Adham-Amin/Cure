import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/feedback/data/datasources/feedback_remote_data_source.dart';
import 'package:cure/features/feedback/data/models/feedback_request.dart';
import 'package:cure/features/feedback/domain/repositories/feedback_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FeedbackRepoImpl implements FeedbackRepo {
  final FeedbackRemoteDataSource feedbackRemoteDataSource;
  FeedbackRepoImpl({required this.feedbackRemoteDataSource});
  @override
  Future<Either<Failure, void>> sendFeedback({
    required FeedbackRequest feedbackRequest,
  }) async {
    try {
      await feedbackRemoteDataSource.submitFeedback(feedback: feedbackRequest);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
