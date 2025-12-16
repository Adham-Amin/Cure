part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final UserEntity? user;
  AuthLoaded({this.user});
}

final class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}
