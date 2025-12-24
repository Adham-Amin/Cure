import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/doctor_details/domain/repositories/doctor_details_repo.dart';
import 'package:cure/features/doctor_details/presentation/cubit/doctor_details_cubit.dart';
import 'package:cure/features/doctor_details/presentation/widgets/doctor_deatails_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorDetailsCubit(doctorDetailsRepo: getIt<DoctorDetailsRepo>())
            ..getDoctorDetails(doctorId: id),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: const Text('Doctor Deatails'),
        ),
        body: const DoctorDeatailsViewBody(),
      ),
    );
  }
}
