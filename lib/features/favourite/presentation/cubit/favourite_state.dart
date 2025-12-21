part of 'favourite_cubit.dart';

abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<DoctorEntity> doctors;
  FavouriteLoaded({required this.doctors});
}

class FavouriteToggleLoaded extends FavouriteState {
  final String message;
  FavouriteToggleLoaded({required this.message});
}

class FavouriteCheckLoaded extends FavouriteState {
  final bool isFavourite;
  FavouriteCheckLoaded({required this.isFavourite});
}

class FavouriteError extends FavouriteState {
  final String message;
  FavouriteError({required this.message});
}
