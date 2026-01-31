import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/doctors/domain/repo/doctor_repo.dart';
import 'package:cure/features/doctors/presentation/cubit/doctors_cubit.dart';
import 'package:cure/features/doctors/presentation/widgets/doctors_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorsCubit(doctorsRepo: getIt<DoctorsRepo>())..getDoctors(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
          title: const Text('Doctors'),
        ),
        body: DoctorsViewBody(),
      ),
    );
  }
}
