import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/home/domain/entities/home_entity.dart';
import 'package:cure/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  final HomeRepo homeRepo;

  HomeEntity home = HomeEntity(
    greeting: 'Welcome Back, User',
    address: '13 Street, New York, USA',
    specialities: ['speciality', 'speciality', 'speciality'],
    doctors: [
      DoctorEntity(
        id: 0,
        name: 'name',
        specialty: 'specialty',
        clinicAddress: 'clinicAddress',
        averageRating: 0,
      ),
    ],
  );

  List<DoctorEntity> doctors = [
    DoctorEntity(
      id: 0,
      name: 'name',
      specialty: 'specialty',
      clinicAddress: 'clinicAddress',
      averageRating: 0,
    ),
    DoctorEntity(
      id: 0,
      name: 'name',
      specialty: 'specialty',
      clinicAddress: 'clinicAddress',
      averageRating: 0,
    ),
    DoctorEntity(
      id: 0,
      name: 'name',
      specialty: 'specialty',
      clinicAddress: 'clinicAddress',
      averageRating: 0,
    ),
  ];
  Future<void> getHomeData() async {
    emit(HomeLoading());

    final results = await Future.wait([
      homeRepo.getHomeData(),
      homeRepo.getDoctors(),
    ]);

    final homedata = results[0] as Either<Failure, HomeEntity>;
    final doctors = results[1] as Either<Failure, List<DoctorEntity>>;

    if (homedata.isLeft() || doctors.isLeft()) {
      final failure =
          homedata.fold((f) => f, (_) => null) ??
          doctors.fold((f) => f, (_) => null);
      emit(HomeError(message: failure!.message));
      return;
    }

    home = homedata.getOrElse(() => home);
    this.doctors = doctors.getOrElse(() => []);

    emit(HomeLoaded());
  }
}
