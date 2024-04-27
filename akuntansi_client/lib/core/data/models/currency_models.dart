import '../../domains/entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({
    required String data,
  }) : super(
          data: data,
        );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        data: json['data'],
      );
}
