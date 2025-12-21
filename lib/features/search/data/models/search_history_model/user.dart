class User {
  int? id;
  String? name;
  String? email;
  String? mobile;

  User({this.id, this.name, this.email, this.mobile});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    mobile: json['mobile'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'mobile': mobile,
  };
}
