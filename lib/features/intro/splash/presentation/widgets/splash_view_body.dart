// ignore_for_file: use_build_context_synchronously

import 'package:cure/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (Prefs.getBool('SeenOn')) {
        if (Prefs.getUser() != null) {
          context.go(AppRoutes.main);
        } else {
          context.go(AppRoutes.login);
        }
      } else {
        context.go(AppRoutes.onbording);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          SvgPicture.asset(
            AppAssets.svgsLogo,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            width: 150.w,
          ),
          Spacer(flex: 1),
          LottieBuilder.asset(AppAssets.lottiesLoading),
        ],
      ),
    );
  }
}
