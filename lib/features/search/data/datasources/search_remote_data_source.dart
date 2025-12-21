import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/search/data/models/search_history_model/search_history_model.dart';
import 'package:cure/features/search/data/models/search_model/search_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchModel>> getSearchData({required String query});
  Future<List<SearchHistoryModel>> getSearchHistory();
  Future<void> clearSearchHistory();
  Future<void> deleteSpecificSearch({required String id});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService apiService;
  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> clearSearchHistory() async {
    await apiService.delete(endPoint: '/search/history');
  }

  @override
  Future<void> deleteSpecificSearch({required String id}) async {
    await apiService.delete(endPoint: '/search/history/$id');
  }

  @override
  Future<List<SearchModel>> getSearchData({required String query}) async {
    final response = await apiService.post(
      endPoint: '/search/history?search_query=$query',
    );

    List<SearchModel> searchData = [];

    for (var item in response['data']) {
      searchData.add(SearchModel.fromJson(item));
    }
    return searchData;
  }

  @override
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    final response = await apiService.get(endPoint: '/search/history');
    List<SearchHistoryModel> searchHistory = [];

    for (var item in response['data']) {
      searchHistory.add(SearchHistoryModel.fromJson(item));
    }
    return searchHistory;
  }
}
