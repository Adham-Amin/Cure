class DoctorsNearYou {
  int? id;
  String? name;
  String? specialty;
  String? clinicAddress;
  int? averageRating;
  int? reviewsCount;
  String? availability;
  String? consultation;
  bool? isFavorite;
  dynamic image;
  String? latitude;
  String? longitude;
  int? distanceKm;

  DoctorsNearYou({
    this.id,
    this.name,
    this.specialty,
    this.clinicAddress,
    this.averageRating,
    this.reviewsCount,
    this.availability,
    this.consultation,
    this.isFavorite,
    this.image,
    this.latitude,
    this.longitude,
    this.distanceKm,
  });

  factory DoctorsNearYou.fromJson(Map<String, dynamic> json) {
    return DoctorsNearYou(
      id: json['id'] as int?,
      name: json['name'] as String?,
      specialty: json['specialty'] as String?,
      clinicAddress: json['clinic_address'] as String?,
      averageRating: json['average_rating'] as int?,
      reviewsCount: json['reviews_count'] as int?,
      availability: json['availability'] as String?,
      consultation: json['consultation'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      image: json['image'] as dynamic,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      distanceKm: json['distance_km'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'specialty': specialty,
    'clinic_address': clinicAddress,
    'average_rating': averageRating,
    'reviews_count': reviewsCount,
    'availability': availability,
    'consultation': consultation,
    'is_favorite': isFavorite,
    'image': image,
    'latitude': latitude,
    'longitude': longitude,
    'distance_km': distanceKm,
  };
}
