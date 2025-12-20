import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/specialties/domain/repo/specialties_repo.dart';
import 'package:cure/features/specialties/presentation/manager/cubit/specialties_cubit.dart';
import 'package:cure/features/specialties/presentation/widgets/doctors_specialty_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorsBySpecialtyView extends StatelessWidget {
  const DoctorsBySpecialtyView({super.key, required this.specialty});

  final String specialty;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SpecialtiesCubit(specialtiesRepo: getIt<SpecialtiesRepo>())
            ..getSpecialties(specialties: specialty),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
          title: Text(specialty),
        ),
        body: DoctorsBySpecialtyViewBody(),
      ),
    );
  }
}
