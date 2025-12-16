import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.imagesLogo, width: 60.w),
        36.hs,
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.textSemiBold24,
        ),
      ],
    );
  }
}
