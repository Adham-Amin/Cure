import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/search/domain/entities/search_history_entity.dart';
import 'package:cure/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHistoryList extends StatelessWidget {
  const SearchHistoryList({
    super.key,
    required this.searchHistory,
    required this.controller,
  });

  final List<SearchHistoryEntity> searchHistory;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    if (searchHistory.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'Search History is Empty',
            style: AppStyles.textRegular16,
          ),
        ),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 8.w,
              runSpacing: 12.h,
              children: List.generate(
                searchHistory.length,
                (index) => GestureDetector(
                  onTap: () {
                    controller.text = searchHistory[index].name;
                    FocusScope.of(context).unfocus();
                    context.read<SearchCubit>().getSearchData(
                      query: searchHistory[index].name,
                    );
                  },
                  child: Chip(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    backgroundColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    label: Text(
                      searchHistory[index].name,
                      style: AppStyles.textRegular16,
                    ),
                    deleteIcon: const Icon(Icons.close, size: 18),
                    onDeleted: () {
                      context.read<SearchCubit>().deleteSpecificSearch(
                        id: searchHistory[index].id.toString(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
