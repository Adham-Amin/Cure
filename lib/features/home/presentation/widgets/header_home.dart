import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/home/presentation/widgets/container_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: Row(
        children: [
          Container(
            height: 42.h,
            width: 42.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(Prefs.getUser()?.imageUrl ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          8.ws,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome ${Prefs.getUser()!.name}',
                  style: AppStyles.textRegular14.copyWith(
                    fontFamily: AppStyles.fontGeorgia,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                      size: 16.sp,
                      color: AppColors.darkGrey,
                    ),
                    4.ws,
                    Text(
                      Prefs.getUser()?.address ?? '',
                      style: AppStyles.textRegular12.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ContainerWithShadow(
            onTap: () {
              context.push(AppRoutes.favourite);
            },
            child: Icon(FontAwesomeIcons.heart, size: 20),
          ),
          16.ws,
          ContainerWithShadow(
            onTap: () {
              context.push(AppRoutes.notifications);
            },
            child: Icon(FontAwesomeIcons.bell, size: 20),
          ),
        ],
      ),
    );
  }
}
