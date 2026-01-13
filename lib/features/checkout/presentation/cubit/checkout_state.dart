part of 'checkout_cubit.dart';

sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {}

final class CheckoutError extends CheckoutState {
  final String message;
  CheckoutError({required this.message});
}
