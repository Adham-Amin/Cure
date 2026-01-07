import 'package:cure/features/update_number/domain/repositories/update_number_repo.dart';
import 'package:cure/features/update_number/presentation/cubit/update_number_cubit.dart';
import 'package:cure/features/update_number/presentation/widgets/update_num_otp_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cure/core/di/service_locator.dart';
import 'package:go_router/go_router.dart';

class ChangeNumOtpView extends StatelessWidget {
  final String num;
  final String newNum;
  const ChangeNumOtpView({super.key, required this.num, required this.newNum});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateNumberCubit(updateNumberRepo: getIt<UpdateNumberRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
        ),
        body: UpdateNumOtpViewBody(number: num, newNumber: newNum),
      ),
    );
  }
}
