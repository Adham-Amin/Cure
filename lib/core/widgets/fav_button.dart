import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.doctorId});

  final num doctorId;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavouriteCubit, FavouriteState, bool>(
      selector: (state) {
        if (state is FavouriteLoaded) {
          return state.doctors.any((e) => e.id == doctorId);
        }
        return false;
      },
      builder: (context, isFav) {
        return IconButton(
          onPressed: () {
            context.read<FavouriteCubit>().toggleFavourite(
              doctorId: doctorId.toString(),
            );
          },
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : AppColors.darkGrey,
          ),
        );
      },
    );
  }
}
