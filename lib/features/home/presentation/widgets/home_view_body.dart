import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/functions/navigate_to_tab.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_error.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cure/features/home/presentation/widgets/doctors_near_list.dart';
import 'package:cure/features/home/presentation/widgets/doctors_top_rated_list.dart';
import 'package:cure/features/home/presentation/widgets/header_home.dart';
import 'package:cure/features/home/presentation/widgets/home_loadind.dart';
import 'package:cure/features/home/presentation/widgets/specialties_list.dart';
import 'package:cure/features/home/presentation/widgets/title_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return HomeLoadind();
        } else if (state is HomeLoaded) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.hs,
                HeaderHome(home: context.read<HomeCubit>().home),
                24.hs,
                CustomTextFormField(
                  onTap: () {
                    navigateToTab(context, 1);
                  },
                  readOnly: true,
                  hintText: 'Search for specialty, doctor',
                  prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                ),
                24.hs,
                TitleAndSeeAll(
                  onTap: () => context.push(
                    AppRoutes.specialties,
                    extra: context.read<HomeCubit>().home.specialities,
                  ),
                  title: 'Specialties',
                ),
                16.hs,
                SpecialtiesList(),
                24.hs,
                Image.asset(
                  AppAssets.imagesBanner,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                24.hs,
                Text(
                  'Doctors Near You',
                  style: AppStyles.textRegular20.copyWith(
                    fontFamily: AppStyles.fontGeorgia,
                  ),
                ),
                16.hs,
                DoctorsNearList(
                  doctors: context.read<HomeCubit>().home.doctors,
                ),
                24.hs,
                TitleAndSeeAll(
                  onTap: () {
                    context.push(
                      AppRoutes.doctors,
                      extra: context.read<HomeCubit>().home.specialities,
                    );
                  },
                  title: 'Top Rated Doctors',
                ),
                16.hs,
                DoctorsTopRatedList(doctors: context.read<HomeCubit>().doctors),
                24.hs,
              ],
            ),
          );
        } else if (state is HomeError) {
          return CustomError(message: state.message);
        } else {
          return Center(
            child: Text('Something went wrong', style: AppStyles.textRegular14),
          );
        }
      },
    );
  }
}
