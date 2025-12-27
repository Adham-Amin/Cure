part of 'update_number_cubit.dart';

abstract class UpdateNumberState {}

class UpdateNumberInitial extends UpdateNumberState {}

class UpdateNumberLoading extends UpdateNumberState {}

class UpdateNumberLoaded extends UpdateNumberState {}

class UpdateNumberError extends UpdateNumberState {
  final String message;
  UpdateNumberError({required this.message});
}
