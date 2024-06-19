import 'package:equatable/equatable.dart';

class RegisterResponseModel extends Equatable {
  final String? message;
  final int? status;
  final bool? success;

  const RegisterResponseModel({required this.message, this.success, this.status});

  @override
  List<Object?> get props => [message, success];

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        status: json['status'] ?? 500,
        message: json['message'] ?? '',
        success: json['success'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'status': status ?? 500,
        'message': message ?? '',
        'success': success ?? false,
      };
}
