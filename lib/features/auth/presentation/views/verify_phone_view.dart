import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/auth/domain/repo/auth_repo.dart';
import 'package:cure/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:cure/features/auth/presentation/widgets/verify_email_view_bod.dart';

class VerifyPhoneView extends StatelessWidget {
  final String phone;
  const VerifyPhoneView({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(),
        body: VerifyPhoneViewBody(phone: phone),
      ),
    );
  }
}
