import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/core/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsExperiencedList extends StatelessWidget {
  const DoctorsExperiencedList({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return doctors.isEmpty
        ? Container(
            height: 100.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('No Doctors Found', style: AppStyles.textRegular14),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: doctors.length,
            separatorBuilder: (context, index) => 16.hs,
            itemBuilder: (context, index) => DoctorCard(
              image: AppAssets.imagesDocOne,
              doctor: doctors[index],
            ),
          );
  }
}
