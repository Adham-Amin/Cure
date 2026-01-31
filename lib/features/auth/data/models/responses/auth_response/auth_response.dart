import 'data.dart';

class AuthResponse {
  bool? success;
  String? message;
  Data? data;

  AuthResponse({this.success, this.message, this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    success: json['success'] as bool?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };
}
