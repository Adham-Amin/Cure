class Doctor {
  num? id;
  num? userId;
  num? specialtyId;
  String? licenseNumber;
  String? bio;
  num? sessionPrice;
  String? clinicAddress;
  num? latitude;
  num? longitude;
  num? experienceLength;
  DateTime? createdAt;
  DateTime? updatedAt;

  Doctor({
    this.id,
    this.userId,
    this.specialtyId,
    this.licenseNumber,
    this.bio,
    this.sessionPrice,
    this.clinicAddress,
    this.latitude,
    this.longitude,
    this.experienceLength,
    this.createdAt,
    this.updatedAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'] as num?,
    userId: json['user_id'] as num?,
    specialtyId: json['specialty_id'] as num?,
    licenseNumber: json['license_number'] as String?,
    bio: json['bio'] as String?,
    sessionPrice: json['session_price'] as num?,
    clinicAddress: json['clinic_address'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    experienceLength: json['experience_length'] as num?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'specialty_id': specialtyId,
    'license_number': licenseNumber,
    'bio': bio,
    'session_price': sessionPrice,
    'clinic_address': clinicAddress,
    'latitude': latitude,
    'longitude': longitude,
    'experience_length': experienceLength,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
