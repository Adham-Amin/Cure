import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/feedback/data/models/feedback_request.dart';

abstract class FeedbackRemoteDataSource {
  Future<void> submitFeedback({required FeedbackRequest feedback});
}

class FeedbackRemoteDataSourceImpl implements FeedbackRemoteDataSource {
  final ApiService apiService;
  FeedbackRemoteDataSourceImpl({required this.apiService});
  @override
  Future<void> submitFeedback({required FeedbackRequest feedback}) async {
    await apiService.post(endPoint: '/reviews', data: feedback.toJson());
  }
}
