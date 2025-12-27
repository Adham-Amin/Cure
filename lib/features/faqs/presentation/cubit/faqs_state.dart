part of 'faqs_cubit.dart';

abstract class FaqsState {}

class FaqsInitial extends FaqsState {}

class FaqsLoading extends FaqsState {}

class FaqsLoaded extends FaqsState {
  final List<FaqEntity> faqs;
  FaqsLoaded({required this.faqs});
}

class FaqsError extends FaqsState {
  final String message;
  FaqsError({required this.message});
}
