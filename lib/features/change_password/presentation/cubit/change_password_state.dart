part of 'change_password_cubit.dart';

abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordLoaded extends ChangePasswordState {}

class ChangePasswordError extends ChangePasswordState {
  final String message;
  ChangePasswordError({required this.message});
}
