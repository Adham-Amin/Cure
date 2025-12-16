import 'patient.dart';

class Data {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? birthdate;
  String? gender;
  dynamic profilePhoto;
  String? role;
  Patient? patient;

  Data({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.birthdate,
    this.gender,
    this.profilePhoto,
    this.role,
    this.patient,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    mobile: json['mobile'] as String?,
    birthdate: json['birthdate'] as String?,
    gender: json['gender'] as String?,
    profilePhoto: json['profile_photo'] as dynamic,
    role: json['role'] as String?,
    patient: json['patient'] == null
        ? null
        : Patient.fromJson(json['patient'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'birthdate': birthdate,
    'gender': gender,
    'profile_photo': profilePhoto,
    'role': role,
    'patient': patient?.toJson(),
  };
}
