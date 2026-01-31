import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/search/domain/repositories/search_repo.dart';
import 'package:cure/features/search/presentation/cubit/search_cubit.dart';
import 'package:cure/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(searchRepo: getIt<SearchRepo>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Search')),
        body: const SearchViewBody(),
      ),
    );
  }
}
