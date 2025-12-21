import 'package:cure/features/home/domain/entities/doctor_entity.dart';

import 'favorite.dart';

class FavouriteModel {
  List<Favorite>? favorites;

  FavouriteModel({this.favorites});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => Favorite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'favorites': favorites?.map((e) => e.toJson()).toList(),
  };

  List<DoctorEntity> toEntity() =>
      favorites?.map((e) => e.toEntity()).toList() ?? [];
}
