import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:flutter/material.dart';

class DoctorDetailsAbout extends StatelessWidget {
  const DoctorDetailsAbout({super.key, required this.doctor});

  final DoctorDetailsEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: AppStyles.textRegular20.copyWith(
            fontFamily: AppStyles.fontGeorgia,
          ),
        ),
        8.hs,
        Text(
          doctor.aboutMe.isEmpty || doctor.aboutMe == 'null'
              ? 'Dr. ${doctor.name}, a board-certified ${doctor.specialty} with over ${doctor.experience} years of experience in diagnosing and treating a wide range of respiratory'
              : doctor.aboutMe,
          style: AppStyles.textRegular14.copyWith(color: AppColors.darkGrey),
        ),
      ],
    );
  }
}
