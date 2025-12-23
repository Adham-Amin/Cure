import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/widgets/loading_doctor.dart';
import 'package:cure/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:cure/features/favourite/presentation/widgets/empty_fav.dart';
import 'package:cure/core/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return const LoadingDoctor();
          } else if (state is FavouriteLoaded) {
            if (state.doctors.isEmpty) {
              return const EmptyFav();
            }
            return ListView.separated(
              itemCount: state.doctors.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => 16.hs,
              itemBuilder: (context, index) => DoctorCard(
                doctor: state.doctors[index],
                image: AppAssets.imagesDocOne,
              ),
            );
          } else if (state is FavouriteError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
