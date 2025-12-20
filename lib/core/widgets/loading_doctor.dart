import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingDoctor extends StatelessWidget {
  const LoadingDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => 16.hs,
        itemBuilder: (context, index) => DoctorCard(
          doctor: DoctorEntity(
            id: 0,
            name: 'Adham Amin',
            specialty: 'Cardiologist',
            clinicAddress: 'Mansoura',
            averageRating: 4,
          ),
          image: AppAssets.imagesDocOne,
        ),
      ),
    );
  }
}
