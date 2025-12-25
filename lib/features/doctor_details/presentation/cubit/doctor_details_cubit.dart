import 'package:cure/features/doctor_details/domain/entities/doctor_details_entity.dart';
import 'package:cure/features/doctor_details/domain/entities/review_entity.dart';
import 'package:cure/features/doctor_details/domain/repositories/doctor_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit({required this.doctorDetailsRepo})
    : super(DoctorDetailsInitial());

  final DoctorDetailsRepo doctorDetailsRepo;

  DoctorDetailsEntity doctor = DoctorDetailsEntity(
    id: 0,
    experience: 0,
    totalPatient: 0,
    clinicAddress: '5 Example Street',
    specialty: 'Cardiologist',
    aboutMe: '',
    sessionPrice: 0,
    email: '            ',
    mobile: '       ',
    name: 'Adham Amin',
    rating: 0,
    reviewsAvg: 0,
    reviews: [
      ReviewEntity(
        rating: 0,
        name: 'Ahmed Hassan',
        review: 'Doctor is very good',
        createdAt: '22/12/2022 12:00 AM',
      ),
    ],
  );

  Future<void> getDoctorDetails({required String doctorId}) async {
    emit(DoctorDetailsLoading());
    final result = await doctorDetailsRepo.getDoctorDetails(doctorId: doctorId);
    result.fold((l) => emit(DoctorDetailsError(message: l.message)), (r) {
      doctor = r;
      emit(DoctorDetailsLoaded());
    });
  }
}
