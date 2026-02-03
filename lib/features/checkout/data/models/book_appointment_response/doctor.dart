class Doctor {
  num? id;
  String? name;
  String? speciality;
  dynamic image;
  String? address;

  Doctor({this.id, this.name, this.speciality, this.image, this.address});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'] as num?,
    name: json['name'] as String?,
    speciality: json['speciality'] as String?,
    image: json['image'] as dynamic,
    address: json['address'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'speciality': speciality,
    'image': image,
    'address': address,
  };
}
