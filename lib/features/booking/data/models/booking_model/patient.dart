import 'user.dart';

class Patient {
  int? id;
  dynamic gender;
  String? birthdate;
  dynamic medicalNotes;
  User? user;

  Patient({this.id, this.gender, this.birthdate, this.medicalNotes, this.user});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['id'] as int?,
    gender: json['gender'] as dynamic,
    birthdate: json['birthdate'] as String?,
    medicalNotes: json['medical_notes'] as dynamic,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'gender': gender,
    'birthdate': birthdate,
    'medical_notes': medicalNotes,
    'user': user?.toJson(),
  };
}
