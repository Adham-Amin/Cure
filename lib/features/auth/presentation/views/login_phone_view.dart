import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/auth/domain/repo/auth_repo.dart';
import 'package:cure/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:cure/features/auth/presentation/widgets/login_phone_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPhoneView extends StatelessWidget {
  const LoginPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: const LoginPhoneViewBody()),
      ),
    );
  }
}
