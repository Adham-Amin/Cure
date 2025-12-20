import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cure/features/home/presentation/widgets/doctors_near_list.dart';
import 'package:cure/features/home/presentation/widgets/doctors_top_rated_list.dart';
import 'package:cure/features/home/presentation/widgets/header_home.dart';
import 'package:cure/features/home/presentation/widgets/specialties_list.dart';
import 'package:cure/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeLoadind extends StatelessWidget {
  const HomeLoadind({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.hs,
            HeaderHome(home: context.read<HomeCubit>().home),
            24.hs,
            CustomTextFormField(
              onTap: () {},
              readOnly: true,
              hintText: 'Search for specialty, doctor',
              prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
            ),
            24.hs,
            TitleAndSeeAll(onTap: () {}, title: 'Specialties'),
            16.hs,
            SpecialtiesList(),
            24.hs,
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                AppAssets.imagesBanner,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            24.hs,
            Text(
              'Doctors Near You',
              style: AppStyles.textRegular20.copyWith(
                fontFamily: AppStyles.fontGeorgia,
              ),
            ),
            16.hs,
            DoctorsNearList(doctors: context.read<HomeCubit>().home.doctors),
            24.hs,
            TitleAndSeeAll(onTap: () {}, title: 'Top Rated Doctors'),
            16.hs,
            DoctorsTopRatedList(doctors: context.read<HomeCubit>().doctors),
            24.hs,
          ],
        ),
      ),
    );
  }
}
