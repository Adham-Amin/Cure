import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/features/doctors/presentation/cubit/doctors_cubit.dart';
import 'package:cure/core/widgets/doctor_card.dart';
import 'package:cure/core/widgets/empty_doctors.dart';
import 'package:cure/core/widgets/loading_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          24.hs,
          BlocBuilder<DoctorsCubit, DoctorsState>(
            builder: (context, state) {
              if (state is DoctorsLoading) {
                return const LoadingDoctor();
              } else if (state is DoctorsLoaded) {
                if (state.doctors.isEmpty) {
                  return Expanded(child: const EmptyDoctors());
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.doctors.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => 16.hs,
                    itemBuilder: (context, index) => DoctorCard(
                      doctor: state.doctors[index],
                      image: AppAssets.imagesDocOne,
                    ),
                  ),
                );
              } else if (state is DoctorsError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            },
          ),
        ],
      ),
    );
  }
}
