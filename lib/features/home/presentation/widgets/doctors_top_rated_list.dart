import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorsTopRatedList extends StatelessWidget {
  const DoctorsTopRatedList({super.key, required this.doctors});

  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      separatorBuilder: (context, index) => 16.hs,
      itemBuilder: (context, index) {
        final sortedDoctors = doctors
          ..sort((a, b) => b.averageRating.compareTo(a.averageRating));
        return DoctorCard(
          image: AppAssets.imagesDocOne,
          doctor: sortedDoctors[index],
        );
      },
    );
  }
}
