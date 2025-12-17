import 'location.dart';

class User {
  int? id;
  String? name;
  String? greeting;
  Location? location;
  String? profilePhoto;

  User({this.id, this.name, this.greeting, this.location, this.profilePhoto});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    greeting: json['greeting'] as String?,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    profilePhoto: json['profile_photo'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'greeting': greeting,
    'location': location?.toJson(),
    'profile_photo': profilePhoto,
  };
}
