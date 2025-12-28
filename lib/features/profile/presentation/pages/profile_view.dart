import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/profile/domain/repositories/profile_repo.dart';
import 'package:cure/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cure/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(profileRepo: getIt<ProfileRepo>()),
      child: const Scaffold(body: SafeArea(child: ProfileViewBody())),
    );
  }
}
