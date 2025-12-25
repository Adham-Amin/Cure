class User {
  num? id;
  String? name;
  String? email;
  String? mobile;
  String? gender;

  User({this.id, this.name, this.email, this.mobile, this.gender});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as num?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    mobile: json['mobile'] as String?,
    gender: json['gender'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
    'gender': gender,
  };
}
