import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cure/core/widgets/specialties_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SpecialtiesList extends StatelessWidget {
  const SpecialtiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SpecialtiesCard(
            onTap: () {
              context.push(
                AppRoutes.doctorsBySpecialties,
                extra: context.read<HomeCubit>().home.specialities[index],
              );
            },
            title: context.read<HomeCubit>().home.specialities[index],
          ),
        ),
      ),
    );
  }
}
