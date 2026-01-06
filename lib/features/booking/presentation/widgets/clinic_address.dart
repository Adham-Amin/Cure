import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClinicAddress extends StatelessWidget {
  const ClinicAddress({super.key, required this.address});

  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.svgsIcLocation,
          colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
        ),
        8.ws,
        Expanded(
          child: Text(
            address,
            style: AppStyles.textRegular14.copyWith(color: AppColors.darkGrey),
          ),
        ),
      ],
    );
  }
}
