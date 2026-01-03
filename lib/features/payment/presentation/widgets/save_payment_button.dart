import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/payment/data/models/add_payment_request.dart';
import 'package:cure/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SavePaymentButton extends StatelessWidget {
  const SavePaymentButton({
    super.key,
    required this.formKey,
    required this.onInvalid,
    required this.getCardData,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onInvalid;
  final AddPaymentRequest Function() getCardData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentLoaded) {
          customSnackBar(
            context: context,
            message: 'Card added successfully',
            type: AnimatedSnackBarType.success,
          );
          context.pop();
        } else if (state is PaymentError) {
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading,
          title: 'Save',
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<PaymentCubit>().addPaymentCard(card: getCardData());
            } else {
              onInvalid();
            }
          },
        );
      },
    );
  }
}
