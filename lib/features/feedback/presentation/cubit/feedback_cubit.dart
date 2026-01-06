import 'package:flutter_bloc/flutter_bloc.dart';
part 'feedback_state.dart';

class AddReviewCubit extends Cubit<FeedbackState> {
  AddReviewCubit() : super(FeedbackInitial());
}
