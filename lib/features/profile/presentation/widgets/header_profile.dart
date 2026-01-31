import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HeaderProfile extends StatefulWidget {
  const HeaderProfile({super.key});

  @override
  State<HeaderProfile> createState() => _HeaderProfileState();
}

class _HeaderProfileState extends State<HeaderProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.lightCard,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () async {
          final result = await context.push(AppRoutes.editProfile);
          if (result == true) {
            setState(() {});
          }
        },
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(Prefs.getUser()?.imageUrl ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          Prefs.getUser()!.name,
          style: AppStyles.textMedium18.copyWith(
            fontFamily: AppStyles.fontGeorgia,
          ),
        ),
        subtitle: Text(
          Prefs.getUser()!.email,
          style: AppStyles.textRegular14.copyWith(color: AppColors.darkGrey),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.darkGrey,
          size: 20,
        ),
      ),
    );
  }
}
