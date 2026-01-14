import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/doctor_card.dart';
import 'package:cure/features/checkout/domain/entities/doctor_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HeaderCheckout extends StatelessWidget {
  const HeaderCheckout({super.key, required this.doctor});
  final DoctorInfoEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 60.w, backgroundImage: AssetImage(doctor.image)),
        16.ws,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textRegular16.copyWith(
                  fontFamily: AppStyles.fontGeorgia,
                ),
              ),
              8.hs,
              Text(
                doctor.specialty,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textRegular14.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
              8.hs,
              Row(
                children: [
                  SvgPicture.asset(AppAssets.svgsIcLocation),
                  8.ws,
                  Expanded(
                    child: Text(
                      doctor.clinicAddress,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textMedium14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        FavButton(doctorId: doctor.id),
      ],
    );
  }
}
