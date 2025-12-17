class Location {
  String? address;
  String? locationLat;
  String? locationLng;

  Location({this.address, this.locationLat, this.locationLng});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json['address'] as String?,
    locationLat: json['location_lat'] as String?,
    locationLng: json['location_lng'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'address': address,
    'location_lat': locationLat,
    'location_lng': locationLng,
  };
}
