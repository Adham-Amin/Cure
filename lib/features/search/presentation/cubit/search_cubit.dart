import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/search/domain/entities/search_history_entity.dart';
import 'package:cure/features/search/domain/repositories/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> getSearchData({required String query}) async {
    emit(SearchLoading());
    final result = await searchRepo.getSearchData(query: query);
    result.fold(
      (l) => emit(SearchError(message: l.message)),
      (r) => emit(SearchLoaded(doctors: r)),
    );
  }

  Future<void> getSearchHistory() async {
    emit(SearchLoading());
    final result = await searchRepo.getSearchHistory();
    result.fold(
      (l) => emit(SearchError(message: l.message)),
      (r) => emit(SearchHistoryLoaded(search: r)),
    );
  }

  Future<void> clearSearchHistory() async {
    final result = await searchRepo.clearSearchHistory();
    result.fold(
      (l) => emit(SearchError(message: l.message)),
      (r) => emit(SearchHistoryLoaded(search: [])),
    );
  }

  Future<void> deleteSpecificSearch({required String id}) async {
    final result = await searchRepo.deleteSpecificSearch(id: id);
    result.fold((l) => emit(SearchError(message: l.message)), (r) async {
      await getSearchHistory();
    });
  }
}
