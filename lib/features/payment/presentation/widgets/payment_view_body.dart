import 'package:cure/core/widgets/custom_error.dart';
import 'package:cure/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:cure/features/payment/presentation/widgets/empty_payment.dart';
import 'package:cure/features/payment/presentation/widgets/loading_cards.dart';
import 'package:cure/features/payment/presentation/widgets/payment_cards_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoaded) {
            if (state.cards.isEmpty) {
              return const EmptyPayment();
            }
            return PaymentCardsList(cards: state.cards);
          } else if (state is PaymentError) {
            return CustomError(message: state.message);
          } else {
            return LoadingCards();
          }
        },
      ),
    );
  }
}
