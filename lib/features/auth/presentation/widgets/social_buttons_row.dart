import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/auth/presentation/widgets/social_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';

class SocialButtonsAndOr extends StatelessWidget {
  const SocialButtonsAndOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppColors.grey,
                indent: 32.w,
                thickness: 1.h,
              ),
            ),
            16.ws,
            Text(
              'Or',
              style: AppStyles.textMedium14.copyWith(color: AppColors.grey),
            ),
            16.ws,
            Expanded(
              child: Divider(
                color: AppColors.grey,
                endIndent: 32.w,
                thickness: 1.h,
              ),
            ),
          ],
        ),
        24.hs,
        CustomButton(
          title: 'Sign in with Phone',
          onTap: () => context.push(AppRoutes.phoneLogin),
          backgroundColor: AppColors.white,
          colorText: AppColors.primary,
        ),
        12.hs,
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              customSnackBar(
                context: context,
                message: state.message,
                type: AnimatedSnackBarType.error,
              );
            }
            if (state is AuthLoaded) {
              customSnackBar(
                context: context,
                message: 'Welcome ${state.user!.name}',
                type: AnimatedSnackBarType.success,
              );
              context.go(AppRoutes.main);
            }
          },
          child: SocialButton(
            text: 'Sign in with Google',
            iconPath: AppAssets.svgsIcGogole,
            onPressed: () {
              context.read<AuthCubit>().loginWithGoogle();
            },
          ),
        ),
      ],
    );
  }
}
