import 'package:cure/features/feedback/data/models/feedback_request.dart';
import 'package:cure/features/feedback/domain/repositories/feedback_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit({required this.feedbackRepo}) : super(FeedbackInitial());

  final FeedbackRepo feedbackRepo;

  Future<void> sendFeedback({required FeedbackRequest feedbackRequest}) async {
    emit(FeedbackLoading());
    final response = await feedbackRepo.sendFeedback(
      feedbackRequest: feedbackRequest,
    );
    response.fold(
      (l) => emit(FeedbackError(message: l.message)),
      (r) => emit(FeedbackLoaded()),
    );
  }
}
