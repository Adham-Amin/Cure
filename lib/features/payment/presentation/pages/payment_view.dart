import 'package:cure/features/payment/presentation/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Payment Method'),
      ),
      body: PaymentViewBody(),
    );
  }
}
