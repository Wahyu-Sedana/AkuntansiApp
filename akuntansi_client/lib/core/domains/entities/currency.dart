import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String data;

  const Currency({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}
