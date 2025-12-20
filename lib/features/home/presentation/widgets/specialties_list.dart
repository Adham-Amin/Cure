import 'package:cure/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cure/features/home/presentation/widgets/specialties_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            onTap: () {},
            title: context.read<HomeCubit>().home.specialities[index],
          ),
        ),
      ),
    );
  }
}
