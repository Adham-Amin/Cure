part of 'doctor_details_cubit.dart';

abstract class DoctorDetailsState {}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsLoaded extends DoctorDetailsState {
  final DoctorDetailsEntity doctor;
  DoctorDetailsLoaded({required this.doctor});
}

class DoctorDetailsError extends DoctorDetailsState {
  final String message;
  DoctorDetailsError({required this.message});
}
