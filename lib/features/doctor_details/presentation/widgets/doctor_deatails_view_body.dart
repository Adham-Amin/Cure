import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/widgets/custom_error.dart';
import 'package:cure/features/doctor_details/presentation/cubit/doctor_details_cubit.dart';
import 'package:cure/features/doctor_details/presentation/widgets/doctor_details_about.dart';
import 'package:cure/features/doctor_details/presentation/widgets/doctor_details_bottom_bar.dart';
import 'package:cure/features/doctor_details/presentation/widgets/doctor_details_header.dart';
import 'package:cure/features/doctor_details/presentation/widgets/doctor_details_item.dart';
import 'package:cure/features/doctor_details/presentation/widgets/reviews_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorDeatailsViewBody extends StatelessWidget {
  const DoctorDeatailsViewBody({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsError) {
          return CustomError(message: state.message);
        }
        final doctor = context.read<DoctorDetailsCubit>().doctor;
        return SizedBox.expand(
          child: Stack(
            children: [
              Skeletonizer(
                enabled: state is DoctorDetailsLoading,
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 140.h),
                  child: Column(
                    children: [
                      DoctorDetailsHeader(doctor: doctor, image: image),
                      24.hs,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DoctorDetailsItem(
                            image: AppAssets.svgsIcPatients,
                            title: '${doctor.totalPatient}+',
                            subtitle: 'Patients',
                          ),
                          DoctorDetailsItem(
                            image: AppAssets.svgsIcMedal,
                            title: '${doctor.experience}+',
                            subtitle: 'Experience',
                          ),
                          DoctorDetailsItem(
                            image: AppAssets.svgsIcStar,
                            title: '${doctor.rating}',
                            subtitle: 'Rating',
                          ),
                          DoctorDetailsItem(
                            image: AppAssets.svgsIcMessages,
                            title: '${doctor.reviewsAvg}',
                            subtitle: 'Reviews',
                          ),
                        ],
                      ),
                      24.hs,
                      DoctorDetailsAbout(doctor: doctor),
                      24.hs,
                      ReviewsSection(
                        reviews: doctor.reviews,
                        rating: doctor.rating,
                        reviewsCount: doctor.reviewsAvg,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: DoctorDetailsBottomBar(doctor: doctor),
              ),
            ],
          ),
        );
      },
    );
  }
}
