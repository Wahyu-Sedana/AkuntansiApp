import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final LoginDataModel? data;
  final bool? success;
  final int? status;
  final String? message;
  const LoginResponseModel({
    this.data,
    this.status,
    this.success,
    this.message,
  });

  @override
  List<Object?> get props => [data, status, success, message];

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    return LoginResponseModel(
      data: data.isNotEmpty ? LoginDataModel.fromJson(data[0]) : null,
      status: json['status'] ?? 500,
      message: json['message'] ?? '',
      success: json['success'] ?? false,
    );
  }
  Map<String, dynamic> toJson() => {
        'data': data == null ? '' : data!.toJson(),
        'status': status ?? 500,
        'message': message ?? '',
        'success': success ?? false,
      };
}

class LoginDataModel extends Equatable {
  final num userId;
  final String namaUsaha;
  final String alamat;
  final String email;
  final String password;

  const LoginDataModel(
      {required this.userId,
      required this.namaUsaha,
      required this.alamat,
      required this.email,
      required this.password});

  @override
  List<Object?> get props => [userId, namaUsaha, alamat, email, password];

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
      userId: json['_id_user'],
      namaUsaha: json['_nama_usaha'],
      alamat: json['_alamat'],
      email: json['_email'],
      password: json['_password']);
  Map<String, dynamic> toJson() => {
        '_id': userId,
        '_nama_usaha': namaUsaha,
        '_alamat': alamat,
        '_email': email,
        '_password': password
      };
}
