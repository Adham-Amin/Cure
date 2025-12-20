import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/home/presentation/widgets/doctor_card.dart';
import 'package:cure/features/specialties/presentation/manager/cubit/specialties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorsBySpecialtyViewBody extends StatelessWidget {
  const DoctorsBySpecialtyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        if (state is SpecialtiesLoading) {
          return LoadingDoctor();
        } else if (state is SpecialtiesLoaded) {
          if (state.doctors.isEmpty) {
            return EmptyDoctors();
          }
          return ListView.separated(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
            itemCount: state.doctors.length,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => 16.hs,
            itemBuilder: (context, index) => DoctorCard(
              doctor: state.doctors[index],
              image: AppAssets.imagesDocOne,
            ),
          );
        } else if (state is SpecialtiesError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

class EmptyDoctors extends StatelessWidget {
  const EmptyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_off_outlined, color: AppColors.grey, size: 64.w),
          24.hs,
          Text('No Doctors Found', style: AppStyles.textRegular14),
        ],
      ),
    );
  }
}

class LoadingDoctor extends StatelessWidget {
  const LoadingDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
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
