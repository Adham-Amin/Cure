import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/widgets/custom_error.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/core/widgets/empty_doctors.dart';
import 'package:cure/core/widgets/loading_doctor.dart';
import 'package:cure/core/widgets/doctor_card.dart';
import 'package:cure/features/search/presentation/cubit/search_cubit.dart';
import 'package:cure/features/search/presentation/widgets/search_history_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.hs,
          CustomTextFormField(
            controller: _searchController,
            hintText: 'Search for specialty, doctor',
            prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
            onChanged: (value) {
              if (value.trim().isEmpty &&
                  context.read<SearchCubit>().state is! SearchHistoryLoaded) {
                context.read<SearchCubit>().getSearchHistory();
              }
            },
            onFieldSubmitted: (value) {
              if (value.trim().isEmpty) return;
              context.read<SearchCubit>().getSearchData(query: value);
            },
          ),
          24.hs,
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchHistoryLoaded) {
                return SearchHistorySection(
                  isLoading: false,
                  controller: _searchController,
                );
              } else if (state is SearchHistoryLoading) {
                return SearchHistorySection(
                  isLoading: true,
                  controller: _searchController,
                );
              } else if (state is SearchLoaded) {
                if (state.doctors.isEmpty) {
                  return const Expanded(child: EmptyDoctors());
                }
                return Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => DoctorCard(
                      doctor: state.doctors[index],
                      image: AppAssets.imagesDocOne,
                    ),
                    separatorBuilder: (_, __) => 16.hs,
                    itemCount: state.doctors.length,
                  ),
                );
              } else if (state is SearchLoading) {
                return const LoadingDoctor();
              } else if (state is SearchError) {
                return CustomError(message: state.message);
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            },
          ),
        ],
      ),
    );
  }
}
