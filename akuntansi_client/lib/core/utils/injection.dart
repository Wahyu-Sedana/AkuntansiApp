import 'package:akuntansi_client/core/utils/session.dart';
import 'package:akuntansi_client/features/splash/presentation/providers/splash_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/login/data/datasources/login_datasource.dart';
import '../../features/login/data/repositories/login_repository_implementation.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecase/do_login.dart';
import '../../features/login/presentation/providers/login_provider.dart';
import '../data/datasources/currency_datasource.dart';
import '../data/repositories/currency_repository_implementation.dart';
import '../domains/repositories/currency_repository.dart';
import '../domains/usecases/get_currency.dart';
import '../networks/dio_client.dart';
import '../networks/network_info.dart';

final locator = GetIt.instance;
late Session sessionHelper;
late bool isLoggedIn;

Future<void> init() async {
  //network info
  locator
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementation(locator<Connectivity>()));

  //external
  locator.registerLazySingleton<Dio>(() => DioClient().dio);
  locator.registerLazySingletonAsync<Session>(
      () async => SessionHelper(pref: await locator.getAsync<SharedPreferences>()));
  locator.registerLazySingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());
  locator.registerLazySingleton<Connectivity>(() => Connectivity());

  //repository
  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImplementation(
      locator<NetworkInfo>(),
      dataSource: locator<LoginDataSource>(),
    ),
  );
  locator.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImplementation(
      dataSource: locator<CurrencyDataSource>(),
      networkInfo: locator<NetworkInfo>(),
    ),
  );

  //datasource
  locator.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImplementation(dio: locator<Dio>()));
  locator.registerLazySingleton<CurrencyDataSource>(
      () => CurrencyDataSourceImplementation(dio: locator<Dio>()));

  //usecase
  locator.registerLazySingleton<DoLogin>(() => DoLogin(repository: locator<LoginRepository>()));
  locator.registerLazySingleton<GetCurrency>(() => GetCurrency(locator<CurrencyRepository>()));

  //providers
  locator.registerFactory(
    () => SplashProvider(getCurrency: locator<GetCurrency>()),
  );
  locator.registerFactory<LoginProvider>(() => LoginProvider(doLogin: locator()));
}
