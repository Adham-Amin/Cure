part of 'doctors_cubit.dart';

sealed class DoctorsState {}

final class DoctorsInitial extends DoctorsState {}

final class DoctorsLoading extends DoctorsState {}

final class DoctorsLoaded extends DoctorsState {
  final List<DoctorEntity> doctors;
  DoctorsLoaded({required this.doctors});
}

final class DoctorsError extends DoctorsState {
  final String message;
  DoctorsError({required this.message});
}
