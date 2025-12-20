class DoctorsNearYou {
  num? id;
  String? name;
  String? specialty;
  String? clinicAddress;
  num? averageRating;
  num? reviewsCount;
  String? consultation;
  bool? isFavorite;
  dynamic image;
  String? latitude;
  String? longitude;
  num? distanceKm;

  DoctorsNearYou({
    this.id,
    this.name,
    this.specialty,
    this.clinicAddress,
    this.averageRating,
    this.reviewsCount,
    this.consultation,
    this.isFavorite,
    this.image,
    this.latitude,
    this.longitude,
    this.distanceKm,
  });

  factory DoctorsNearYou.fromJson(Map<String, dynamic> json) {
    return DoctorsNearYou(
      id: json['id'] as num?,
      name: json['name'] as String?,
      specialty: json['specialty'] as String?,
      clinicAddress: json['clinic_address'] as String?,
      averageRating: json['average_rating'] as num?,
      reviewsCount: json['reviews_count'] as num?,
      consultation: json['consultation'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      image: json['image'] as dynamic,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      distanceKm: json['distance_km'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'specialty': specialty,
    'clinic_address': clinicAddress,
    'average_rating': averageRating,
    'reviews_count': reviewsCount,
    'consultation': consultation,
    'is_favorite': isFavorite,
    'image': image,
    'latitude': latitude,
    'longitude': longitude,
    'distance_km': distanceKm,
  };
}
