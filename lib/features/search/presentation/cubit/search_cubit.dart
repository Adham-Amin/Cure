import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/search/domain/repositories/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> getDoctors({required String query}) async {
    emit(SearchLoading());
    final result = await searchRepo.getDoctors(query: query);
    result.fold(
      (l) => emit(SearchError(message: l.message)),
      (r) => emit(SearchLoaded(doctors: r)),
    );
  }
}
