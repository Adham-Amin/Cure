import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/fav_button.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.image, required this.doctor});

  final String image;
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        AppRoutes.doctorDetails,
        extra: {'id': doctor.id, 'image': image},
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.lightGrey),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: 90.w,
                height: 90.w,
              ),
            ),
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
                      color: AppColors.black,
                    ),
                  ),
                  8.hs,
                  Text(
                    '${doctor.specialty} | ${doctor.clinicAddress}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textRegular14.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  8.hs,
                  Row(
                    children: [
                      Icon(Icons.star, size: 16.sp, color: Colors.amber),
                      8.ws,
                      Text(
                        doctor.averageRating.toString(),
                        style: AppStyles.textMedium14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      16.ws,
                      Icon(
                        FontAwesomeIcons.clock,
                        size: 16.sp,
                        color: AppColors.darkGrey,
                      ),
                      8.ws,
                      Text(
                        '9:00 AM - 3:00 PM',
                        style: AppStyles.textMedium14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FavButton(doctorId: doctor.id),
          ],
        ),
      ),
    );
  }
}
