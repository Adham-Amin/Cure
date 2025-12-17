part of 'specialties_cubit.dart';

sealed class SpecialtiesState {}

final class SpecialtiesInitial extends SpecialtiesState {}

final class SpecialtiesLoading extends SpecialtiesState {}

final class SpecialtiesLoaded extends SpecialtiesState {
  final List<DoctorEntity> doctors;
  SpecialtiesLoaded({required this.doctors});
}

final class SpecialtiesError extends SpecialtiesState {
  final String message;
  SpecialtiesError({required this.message});
}
