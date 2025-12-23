import 'package:cure/features/favourite/domain/repositories/favourite_repo.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({required this.favouriteRepo}) : super(FavouriteInitial());

  final FavouriteRepo favouriteRepo;

  Future<void> getFavourite() async {
    emit(FavouriteLoading());
    final result = await favouriteRepo.getFavourite();
    result.fold(
      (l) => emit(FavouriteError(message: l.message)),
      (r) => emit(FavouriteLoaded(doctors: r)),
    );
  }

  Future<void> toggleFavourite({required String doctorId}) async {
    final currentState = state;

    if (currentState is FavouriteLoaded) {
      final result = await favouriteRepo.toggleFavourite(doctorId: doctorId);

      result.fold((l) => emit(FavouriteError(message: l.message)), (r) async {
        final favResult = await favouriteRepo.getFavourite();
        favResult.fold(
          (l) => emit(FavouriteError(message: l.message)),
          (doctors) => emit(FavouriteLoaded(doctors: doctors)),
        );
      });
    }
  }

  Future<void> checkFavourite({required String doctorId}) async {
    final result = await favouriteRepo.checkFavourite(doctorId: doctorId);
    result.fold(
      (l) => emit(FavouriteError(message: l.message)),
      (r) => emit(FavouriteCheckLoaded(isFavourite: r)),
    );
  }
}
