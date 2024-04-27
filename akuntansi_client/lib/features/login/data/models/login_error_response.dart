import 'package:akuntansi_client/core/utils/helper.dart';
import 'package:equatable/equatable.dart';

class LoginErrorResponseModel extends Equatable {
  final String errorMessage;

  const LoginErrorResponseModel({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];

  factory LoginErrorResponseModel.fromJson(Map<String, dynamic> json) {
    late String _errorMessage;

    try {
      final String? errorMessage = json['message'] ?? '';

      _errorMessage = errorMessage!;
    } catch (e) {
      logMe(e);
      _errorMessage = '';
    }
    return LoginErrorResponseModel(
      errorMessage: _errorMessage,
    );
  }
}
