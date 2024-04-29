import 'package:equatable/equatable.dart';

class RegisterResponseModel extends Equatable {
  final String? message;
  final bool? success;

  const RegisterResponseModel({required this.message, this.success});

  @override
  List<Object?> get props => [message, success];

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        message: json['message'] ?? '',
        success: json['success'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'message': message ?? '',
        'success': success ?? false,
      };
}
