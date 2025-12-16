import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/auth/domain/repo/auth_repo.dart';
import 'package:cure/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:cure/features/auth/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(),
        body: ResetPasswordViewBody(email: email),
      ),
    );
  }
}
