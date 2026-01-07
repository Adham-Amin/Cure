part of 'feedback_cubit.dart';

abstract class FeedbackState {}

class FeedbackInitial extends FeedbackState {}

class FeedbackLoading extends FeedbackState {}

class FeedbackLoaded extends FeedbackState {}

class FeedbackError extends FeedbackState {
  final String message;

  FeedbackError({required this.message});
}
