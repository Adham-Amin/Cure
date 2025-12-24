import 'package:cure/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:cure/features/doctor_details/domain/repositories/doctor_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit({required this.doctorDetailsRepo})
    : super(DoctorDetailsInitial());

  final DoctorDetailsRepo doctorDetailsRepo;

  Future<void> getDoctorDetails({required String doctorId}) async {
    emit(DoctorDetailsLoading());
    final result = await doctorDetailsRepo.getDoctorDetails(doctorId: doctorId);
    result.fold(
      (l) => emit(DoctorDetailsError(message: l.message)),
      (r) => emit(DoctorDetailsLoaded(doctor: r)),
    );
  }
}
