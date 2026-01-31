import 'package:cure/features/doctors/domain/repo/doctor_repo.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit({required this.doctorsRepo}) : super(DoctorsInitial());

  final DoctorsRepo doctorsRepo;

  Future<void> getDoctors() async {
    emit(DoctorsLoading());
    final result = await doctorsRepo.getDoctors();
    result.fold(
      (failure) => emit(DoctorsError(message: failure.message)),
      (doctors) => emit(DoctorsLoaded(doctors: doctors)),
    );
  }
}
