class RegisterRequest {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;

  RegisterRequest({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'password': password,
    'password_confirmation': passwordConfirmation,
  };
}
