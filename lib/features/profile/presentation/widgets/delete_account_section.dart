import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cure/features/profile/presentation/widgets/profile_item.dart';
import 'package:cure/features/profile/presentation/widgets/show_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountSection extends StatelessWidget {
  const DeleteAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileDeleted) {
          context.go(AppRoutes.login);
          Prefs.clearUserData();
          customSnackBar(
            context: context,
            message: 'Account deleted successfully',
            type: AnimatedSnackBarType.success,
          );
        }
        if (state is ProfileError) {
          customSnackBar(
            context: context,
            message: state.message,
            type: AnimatedSnackBarType.error,
          );
        }
      },
      child: ProfileItem(
        title: 'Delete Account',
        icon: AppAssets.svgsIcPerson,
        onTap: () {
          showCustomDialog(
            context: context,
            title: 'Delete Account',
            message: 'Are you sure you want to delete your account?',
            onTap: () => context.read<ProfileCubit>().deleteAccount(),
          );
        },
      ),
    );
  }
}
