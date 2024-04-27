import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final LoginDataModel? data;
  final bool? success;
  final String? message;
  const LoginResponseModel({
    this.data,
    this.success,
    this.message,
  });

  @override
  List<Object?> get props => [data, success, message];

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        data: json['data'] == null ? null : LoginDataModel.fromJson(json['data']),
        message: json['message'] ?? '',
        success: json['success'] ?? true,
      );
  Map<String, dynamic> toJson() => {
        'data': data == null ? '' : data!.toJson(),
        'message': message ?? '',
        'success': success ?? false,
      };
}

class LoginDataModel extends Equatable {
  final num userId;
  final String username;
  final String email;
  final String password;

  const LoginDataModel(
      {required this.userId, required this.username, required this.email, required this.password});

  @override
  List<Object?> get props => [userId, username, email, password];

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
      userId: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password']);
  Map<String, dynamic> toJson() =>
      {'id': userId, 'username': username, 'email': email, 'password': password};
}
