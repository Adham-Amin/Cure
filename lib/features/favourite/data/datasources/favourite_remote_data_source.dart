import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/favourite/data/models/favourite_model/favourite_model.dart';

abstract class FavouriteRemoteDataSource {
  Future<FavouriteModel> getFavourite();
  Future<void> toggleFavourite({required String doctorId});
  Future<bool> checkFavourite({required String doctorId});
}

class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  final ApiService apiService;
  FavouriteRemoteDataSourceImpl({required this.apiService});

  @override
  Future<bool> checkFavourite({required String doctorId}) async {
    final response = await apiService.get(
      endPoint: '/favorites/check/$doctorId',
    );
    return response['status'];
  }

  @override
  Future<FavouriteModel> getFavourite() async {
    final response = await apiService.get(endPoint: '/favorites');
    return FavouriteModel.fromJson(response['data']);
  }

  @override
  Future<void> toggleFavourite({required String doctorId}) async {
    await apiService.post(endPoint: '/favorites/toggle/$doctorId');
  }
}
