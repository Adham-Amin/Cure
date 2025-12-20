import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/features/doctors/presentation/cubit/doctors_cubit.dart';
import 'package:cure/features/home/presentation/widgets/doctor_card.dart';
import 'package:cure/features/home/presentation/widgets/specialties_card.dart';
import 'package:cure/core/widgets/empty_doctors.dart';
import 'package:cure/core/widgets/loading_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key, required this.specialties});

  final List<String> specialties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          24.hs,
          SpecialtiesSection(specialties: specialties),
          16.hs,
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

class SpecialtiesSection extends StatefulWidget {
  const SpecialtiesSection({super.key, required this.specialties});

  final List<String> specialties;

  @override
  State<SpecialtiesSection> createState() => _SpecialtiesSectionState();
}

class _SpecialtiesSectionState extends State<SpecialtiesSection> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specialties.length + 1,
        separatorBuilder: (context, index) => 8.ws,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => SpecialtiesCard(
          onTap: () {
            setState(() {
              selectIndex = index;
            });
            if (index == 0) {
              context.read<DoctorsCubit>().getDoctors();
            } else {
              context.read<DoctorsCubit>().getDoctorsbySpecialties(
                specialties: widget.specialties[index - 1],
              );
            }
          },
          isSelected: selectIndex == index,
          title: index == 0 ? 'All' : widget.specialties[index - 1],
        ),
      ),
    );
  }
}
