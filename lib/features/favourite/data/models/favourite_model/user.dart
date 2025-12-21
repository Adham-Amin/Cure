class User {
  int? id;
  String? name;
  dynamic email;
  dynamic mobile;
  dynamic profilePhoto;
  dynamic gender;

  User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.profilePhoto,
    this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as dynamic,
    mobile: json['mobile'] as dynamic,
    profilePhoto: json['profile_photo'] as dynamic,
    gender: json['gender'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'profile_photo': profilePhoto,
    'gender': gender,
  };
}
