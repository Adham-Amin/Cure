import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/specialties/domain/repo/specialties_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'specialties_state.dart';

class SpecialtiesCubit extends Cubit<SpecialtiesState> {
  SpecialtiesCubit({required this.specialtiesRepo})
    : super(SpecialtiesInitial());

  final SpecialtiesRepo specialtiesRepo;

  Future<void> getSpecialties({required String specialties}) async {
    emit(SpecialtiesLoading());
    final result = await specialtiesRepo.getDoctorBySpecialties(
      specialties: specialties,
    );
    result.fold(
      (l) => emit(SpecialtiesError(message: l.message)),
      (r) => emit(SpecialtiesLoaded(doctors: r)),
    );
  }
}
