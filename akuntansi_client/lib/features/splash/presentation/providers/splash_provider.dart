import 'package:flutter/foundation.dart';

import '../../../../core/domains/usecases/get_currency.dart';
import '../../../../core/presentation/providers/currency_state.dart';
import '../../../../core/utils/injection.dart';
import '../../../../core/utils/session.dart';

class SplashProvider with ChangeNotifier {
  final GetCurrency getCurrency;

  SplashProvider({required this.getCurrency});

  Stream<CurrencyState> fetchCurrency() async* {
    // enter loading state
    yield CurrencyLoading();

    // getting data
    final result = await getCurrency();
    yield* result.fold(
      (failure) async* {
        // enter failure state
        yield CurrencyFailure(failure: failure);
      },
      (data) async* {
        final session = locator<Session>();
        session.setCurrency = data.data;
        yield CurrencyLoaded(data: data);
      },
    );
  }
}
