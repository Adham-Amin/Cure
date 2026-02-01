import 'birthdate.dart';

class Data {
  String? name;
  String? email;
  String? phone;
  dynamic image;
  String? address;
  Birthdate? birthdate;

  Data({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.address,
    this.birthdate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    image: json['image'] as dynamic,
    address: json['address'] as String?,
    birthdate: json['birthdate'] == null
        ? null
        : Birthdate.fromJson(json['birthdate'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'image': image,
    'address': address,
    'birthdate': birthdate?.toJson(),
  };
}
