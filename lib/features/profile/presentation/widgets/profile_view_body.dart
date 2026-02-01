import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/features/profile/presentation/widgets/delete_account_section.dart';
import 'package:cure/features/profile/presentation/widgets/header_profile.dart';
import 'package:cure/features/profile/presentation/widgets/profile_item.dart';
import 'package:cure/features/profile/presentation/widgets/show_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          48.hs,
          HeaderProfile(),
          64.hs,
          ProfileItem(
            title: 'Password Management',
            icon: AppAssets.svgsIcPass,
            onTap: () => context.push(AppRoutes.changePassword),
          ),
          24.hs,
          ProfileItem(
            title: 'Payment Methods',
            icon: AppAssets.svgsIcPayment,
            onTap: () => context.push(AppRoutes.payment),
          ),
          24.hs,
          ProfileItem(
            title: 'Favourites',
            icon: AppAssets.svgsIcFav,
            onTap: () => context.push(AppRoutes.favourite),
          ),
          24.hs,
          ProfileItem(title: 'FAQs', icon: AppAssets.svgsIcFaq, onTap: () {}),
          24.hs,
          DeleteAccountSection(),
          24.hs,
          ProfileItem(
            title: 'Logout',
            color: Color(0xffFC4B4E),
            icon: AppAssets.svgsIcLogout,
            onTap: () async {
              showCustomDialog(
                context: context,
                title: 'Logout',
                message: 'Are you sure you want to logout?',
                onTap: () async {
                  context.go(AppRoutes.login);
                  await Prefs.clearUserData();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
