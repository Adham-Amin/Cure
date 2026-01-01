part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final List<PaymentEntity> cards;
  PaymentLoaded({required this.cards});
}

class PaymentError extends PaymentState {
  final String message;
  PaymentError({required this.message});
}
