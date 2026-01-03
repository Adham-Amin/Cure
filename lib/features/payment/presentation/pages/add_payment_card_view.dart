import 'package:cure/features/payment/presentation/widgets/add_payment_card_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPaymentCardView extends StatelessWidget {
  const AddPaymentCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Add Payment Card'),
      ),
      body: const AddPaymentCardViewBody(),
    );
  }
}
