import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/payment/domain/repositories/payment_repo.dart';
import 'package:cure/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:cure/features/payment/presentation/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PaymentCubit(paymentRepo: getIt<PaymentRepo>())..getPaymentCards(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text('Payment Method'),
        ),
        body: PaymentViewBody(),
      ),
    );
  }
}
