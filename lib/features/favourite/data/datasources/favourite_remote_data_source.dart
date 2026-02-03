import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/favourite/data/models/favourite_response/favourite_response.dart';

abstract class FavouriteRemoteDataSource {
  Future<List<FavouriteResponse>> getFavourite();
  Future<void> toggleFavourite({required String doctorId});
}

class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  final ApiService apiService;
  FavouriteRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<FavouriteResponse>> getFavourite() async {
    final response = await apiService.get(endPoint: '/profile/favorites');
    if (response['data'] == null) return [];
    return (response['data'] as List)
        .map((e) => FavouriteResponse.fromJson(e))
        .toList();
  }

  @override
  Future<void> toggleFavourite({required String doctorId}) async {
    await apiService.post(endPoint: '/doctors/$doctorId/favorite');
  }
}
