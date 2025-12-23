import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/search/domain/entities/search_history_entity.dart';
import 'package:cure/features/search/presentation/cubit/search_cubit.dart';
import 'package:cure/features/search/presentation/widgets/search_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchHistorySection extends StatelessWidget {
  const SearchHistorySection({
    super.key,
    required this.isLoading,
    required this.controller,
  });

  final bool isLoading;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: isLoading,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'History',
                  style: AppStyles.textRegular20.copyWith(
                    fontFamily: AppStyles.fontGeorgia,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () =>
                      context.read<SearchCubit>().clearSearchHistory(),
                  child: Text('Clear', style: AppStyles.textRegular16),
                ),
              ],
            ),
            BlocSelector<SearchCubit, SearchState, List<SearchHistoryEntity>>(
              selector: (_) => context.read<SearchCubit>().searchHistory,
              builder: (context, history) {
                return SearchHistoryList(
                  controller: controller,
                  searchHistory: history,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
