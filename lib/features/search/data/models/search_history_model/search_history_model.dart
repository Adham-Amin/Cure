import 'package:cure/features/search/domain/entities/search_history_entity.dart';

import 'user.dart';

class SearchHistoryModel {
  int? id;
  String? searchQuery;
  String? searchType;
  dynamic latitude;
  dynamic longitude;
  dynamic locationName;
  DateTime? searchedAt;
  bool? isSaved;
  User? user;

  SearchHistoryModel({
    this.id,
    this.searchQuery,
    this.searchType,
    this.latitude,
    this.longitude,
    this.locationName,
    this.searchedAt,
    this.isSaved,
    this.user,
  });

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    return SearchHistoryModel(
      id: json['id'] as int?,
      searchQuery: json['search_query'] as String?,
      searchType: json['search_type'] as String?,
      latitude: json['latitude'] as dynamic,
      longitude: json['longitude'] as dynamic,
      locationName: json['location_name'] as dynamic,
      searchedAt: json['searched_at'] == null
          ? null
          : DateTime.parse(json['searched_at'] as String),
      isSaved: json['is_saved'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'search_query': searchQuery,
    'search_type': searchType,
    'latitude': latitude,
    'longitude': longitude,
    'location_name': locationName,
    'searched_at': searchedAt?.toIso8601String(),
    'is_saved': isSaved,
    'user': user?.toJson(),
  };

  SearchHistoryEntity toEntity() =>
      SearchHistoryEntity(id: id ?? 0, name: searchQuery ?? 'Adham Amin');
}
