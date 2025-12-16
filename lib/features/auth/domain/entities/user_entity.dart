class UserEntity {
  final num id;
  final num patientId;
  final String imageUrl;
  final String name;
  final String email;
  final String phone;

  UserEntity({
    required this.id,
    required this.patientId,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      patientId: json['patientId'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
      'phone': phone,
      'patientId': patientId,
    };
  }
}
