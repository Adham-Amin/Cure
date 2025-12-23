import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/widgets/doctor_card.dart';
import 'package:cure/features/specialties/presentation/manager/cubit/specialties_cubit.dart';
import 'package:cure/core/widgets/empty_doctors.dart';
import 'package:cure/core/widgets/loading_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsBySpecialtyViewBody extends StatelessWidget {
  const DoctorsBySpecialtyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        if (state is SpecialtiesLoading) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
            child: LoadingDoctor(),
          );
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
