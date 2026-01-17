import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:cure/features/checkout/domain/repo/checkout_repo.dart';
import 'package:cure/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:cure/features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.doctor});

  final DoctorInfoEntity doctor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(checkoutRepo: getIt<CheckoutRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text('Book Appointment'),
        ),
        body: CheckoutViewBody(doctor: doctor),
      ),
    );
  }
}
