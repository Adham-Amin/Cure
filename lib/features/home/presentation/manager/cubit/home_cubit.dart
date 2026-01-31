import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  final HomeRepo homeRepo;

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

  List<DoctorEntity> topExperiencedDoctors = [
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
      homeRepo.getDoctors(),
      homeRepo.getTopExperiencedDoctors(),
    ]);

    final doctors = results[0];
    final topExperiencedDoctors = results[1];

    if (topExperiencedDoctors.isLeft() || doctors.isLeft()) {
      final failure =
          topExperiencedDoctors.fold((f) => f, (_) => null) ??
          doctors.fold((f) => f, (_) => null);
      emit(HomeError(message: failure!.message));
      return;
    }
    this.doctors = doctors.getOrElse(() => []);
    this.topExperiencedDoctors = topExperiencedDoctors.getOrElse(() => []);

    emit(HomeLoaded());
  }
}
