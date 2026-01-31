class UserEntity {
  final String? imageUrl;
  final String name;
  final String email;
  final String phone;
  final String? address;

  UserEntity({
    this.imageUrl,
    required this.name,
    required this.email,
    required this.phone,
    this.address,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      imageUrl: json['imageUrl'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
