import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/profile/domain/repositories/profile_repo.dart';
import 'package:cure/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cure/features/profile/presentation/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(profileRepo: getIt<ProfileRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
          title: const Text('Edit Profile'),
        ),
        body: EditProfileViewBody(),
      ),
    );
  }
}
