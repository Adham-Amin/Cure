import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/change_password/domain/repositories/change_password_repo.dart';
import 'package:cure/features/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:cure/features/change_password/presentation/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangePasswordCubit(changePasswordRepo: getIt<ChangePasswordRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
          title: const Text('Password Management'),
        ),
        body: const ChangePasswordViewBody(),
      ),
    );
  }
}
