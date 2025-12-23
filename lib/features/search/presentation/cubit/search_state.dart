part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<DoctorEntity> doctors;
  SearchLoaded({required this.doctors});
}

class SearchHistoryLoading extends SearchState {}

class SearchHistoryLoaded extends SearchState {}

class SearchError extends SearchState {
  final String message;
  SearchError({required this.message});
}
